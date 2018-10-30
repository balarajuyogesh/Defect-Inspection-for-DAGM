# -*- coding: utf-8 -*-
"""
Created on Wed May 24 10:56:53 2017

@author: Jaekyung
"""
import sys, os
sys.path.append(os.pardir)  # parent directory
import tensorflow as tf
from tensorflow.python.tools import freeze_graph
import numpy as np
import time
from xml.etree.ElementTree import Element, SubElement, dump, ElementTree

sys.path.append("./networks")  # parent directory



import jkcnn1 as network


tf.set_random_seed(777) # reproducibility


class Commander :
    
    def __init__(self, data, Model, args):
        
        self.args = args
        
        self.featureH = self.args.feature_shape[0]
        self.featureW = self.args.feature_shape[1] 
        self.featureC = self.args.feature_shape[2]

        #=====
        self.checkpoint_state_name = "checkpoint_state"
        self.saved_checkpoint = 'saved_checkpoint'
        self.input_graph_name = "input_graph.pb"
        self.output_graph_name = "output_graph.pb"              
        
        
        # initialize
        self.sess = tf.Session()        
        self._model = Model(self.sess, name="DAGM", learning_rate=self.args.learning_rate, 
                                     feature_shape=self.args.feature_shape, lable_size=self.args.label_size )
        
        self._data = data
        
        
        
#        if not os.path.exists('out/'):
#            os.makedirs('out/')
        #dir_path = os.path.dirname(os.path.realpath(__file__))  # To get the full path to the dirctory
        #cwd = os.getcwd()                                       # To get the current working directory


        self.model_dir = "models_tf/"
        if not os.path.exists(self.model_dir):
            os.mkdir(self.model_dir)           
        self.checkpoint_dir = self.model_dir + self.args.load_folder_file[0]
        if not os.path.exists(self.model_dir):
            os.mkdir(self.model_dir)      
            
               
        #self.checkpoint_prefix = os.path.join(self.checkpoint_dir, '/ensemble_model'+str(self.start_model_num)+'_'+str(self.end_model_num))
        #print(self.checkpoint_prefix)        
       
        self.input_graph_path = self.model_dir + self.args.load_folder_file[0]        
        self.checkpoint_prefix = self.checkpoint_dir + self.saved_checkpoint
        self.checkpoint_prefix_backup = self.checkpoint_dir + self.saved_checkpoint +'_backup'
        self.checkpoint_prefix_optimal = self.checkpoint_dir + self.saved_checkpoint +'_optimal'
        self.input_checkpoint_path = self.checkpoint_prefix + "-0"    

        self._saver = tf.train.Saver()
        checkpoint = tf.train.get_checkpoint_state(self.checkpoint_dir, latest_filename=self.checkpoint_state_name)

        self.sess.run(tf.global_variables_initializer())
        
        if self.args.load_model:
            if checkpoint and checkpoint.model_checkpoint_path:
                self._saver.restore(self.sess, checkpoint.model_checkpoint_path)                
                print("|===============================================================================|")
                print("|===== " + checkpoint.model_checkpoint_path + " has been loaded.=====|")
                print("|===============================================================================|")
            elif False:
                print("There are no models")
                raise Exception("Could not load checkpoints for playback")
        else:
            print("Frist training")
       
        
        
    def recordTrainInformation(self, trainingEpochs, batchSize, minCost, maxAccuracy, elapsedTime):        
        note = Element("TrainingInformation")
        SubElement(note, "TrainingEpochs").text = str(trainingEpochs)
        SubElement(note, "BatchSize").text = str(batchSize)    
        SubElement(note, "MinCost").text = str(minCost)
        SubElement(note, "MaxAccuracy").text = str(maxAccuracy)
        SubElement(note, "ElapsedTime").text = str(elapsedTime)
        dump(note)                
        ElementTree(note).write(self.model_dir + "training_imformation.xml")
        
    def createModelInformationXML(self):        
        note = Element("ModelSetting")
        to = Element("ModelName")
        to.text = self.args.load_folder_file[1]    
        note.append(to)
        SubElement(note, "FeatureWidth").text = str(self.args.feature_shape[0])
        SubElement(note, "FeatureHeight").text = str(self.args.feature_shape[1])    
        SubElement(note, "LabelSize").text = str(self.args.label_size)
        dump(note)                
        ElementTree(note).write(self.model_dir + self.args.load_folder_file[1] + ".xml")
        
        
    def train(self, nReDataExtraction=5, training_epochs=20, batch_size=128):
        # Save our model
        tf.train.write_graph(self.sess.graph_def, self.checkpoint_dir, self.input_graph_name, as_text=True)
            
        start_time = time.perf_counter()
        minCost = 100000.
        maxAccuracy = 0.
        elapsed_time = 0.
        current_epoch = 0
        
        # train my model
        print('Learning Started!')               
               
        self._data.getBlockImages(blockH=self.featureH, blockW=self.featureW,
                                  nOKperClass=40, nNGperClass=40,
                                  classNoList=self.args.classNoList, 
                                  label_type='array', isTrain=False) 
        
        current_accuracy = 0
        max_accuracy = self.args.optimalAccuracyThreshold
        for i in range(nReDataExtraction):       
                        
            self._data.getBlockImages(blockH=self.featureH, blockW=self.featureW, 
                                          nOKperClass=160, nNGperClass=160, 
                                          classNoList=self.args.classNoList, 
                                          label_type='array', isTrain=True)
            
            for epoch in range(training_epochs):
                avg_cost = 0.0
                total_batch = int(self._data.train.num_examples / batch_size)                               
                
                for k in range(total_batch):
                    batch_xs, batch_ys = self._data.train.next_batch(batch_size)
                #                print(batch_xs.shape, batch_ys.shape)
                    # train each model                           
                    batch_xs = np.reshape(batch_xs, [-1, self.featureH, self.featureW, self.featureC])
                    cost, _ = self._model.train(batch_xs, batch_ys)
                    avg_cost += cost            
                                
                avg_cost /= total_batch 
                
                if epoch % 10 == 0:
                    # save parameters, training information and our model 
                    #            save_path = saver.save(sess, checkpoint_path + '/network')                                        
                    save_path = self._saver.save(self.sess, self.checkpoint_prefix_backup, global_step=0, latest_filename=self.checkpoint_state_name)                                                                        
                    save_path = self._saver.save(self.sess, self.checkpoint_prefix, global_step=0, latest_filename=self.checkpoint_state_name)                                                                        
                    
                    current_accuracy = self.test(testBatchSize=256)
                    minCost = min(minCost, avg_cost)
                    maxAccuracy = max(maxAccuracy, current_accuracy)
                    print('--------------------------------------------------------------------')
                    print("Current model has been saved.")
                    print('Epoch : %04d' % (i*training_epochs + epoch), ' |  Cost =', avg_cost) 
                    print('--------------------------------------------------------------------')
                    if current_accuracy >= max_accuracy:
                        max_accuracy = current_accuracy                        
                        save_path = self._saver.save(self.sess, self.checkpoint_prefix_optimal, global_step=0, latest_filename=self.checkpoint_state_name)
                        break
            if current_accuracy >= max_accuracy:
                break
            
        # show all variables name
#        for op in tf.get_default_graph().get_operations():
#            print (str(op.name))
        
        elapsed_time = (time.perf_counter() - start_time)
         
        # Save training information and our model                 
        self.recordTrainInformation(current_epoch, batch_size, minCost, maxAccuracy, elapsed_time)
        tf.train.write_graph(self.sess.graph_def, self.model_dir, self.input_graph_name, as_text=True)        
            
        print('=====================================================================')
        print('Minimum cost : ', minCost)
        print("Maximum accuracy : ", maxAccuracy)
        print('Elapsed %.3f seconds.' % elapsed_time)
        print('%.0f h' % (elapsed_time/3600), '%.0f m' % ((elapsed_time%3600)/60) , '%.0f s' % (elapsed_time%60) )
        print('Learning Finished!')   
        print('=====================================================================')
        
        
        
        
    def test(self, testBatchSize=100):
        
        # Test model and check accuracy               
        avg_accuracy = 0.0
        nIter = int(self._data.test.num_examples / testBatchSize)          
        
        for i in range(nIter):
            testX, testY = self._data.test.next_batch(testBatchSize)       
            testX = np.reshape(testX, [-1, self.featureH, self.featureW, self.featureC])
            accuracy = self._model.get_accuracy(testX, testY)
            avg_accuracy += accuracy 
        
        avg_accuracy /= nIter
#        print('logits : ', self._model.predict(testX))     
        print('--------------------------------------------------------------------')
        print('Accuracy: %.2f' %(avg_accuracy*100.0), "%")
        print('--------------------------------------------------------------------')
        
        return avg_accuracy
        
    
    def freezeModel(self, output_node_names="prob" ):                   
        # Note that we this normally should be only "output_node"!!!
        input_saver_def_path = "" 
        input_binary = False                        
        restore_op_name = "save/restore_all"
        filename_tensor_name = "save/Const:0"
        input_graph_path = self.checkpoint_dir + self.input_graph_name 
        output_graph_path = self.checkpoint_dir + self.output_graph_name
        clear_devices = False        
        freeze_graph.freeze_graph(input_graph_path, input_saver_def_path,
                                  input_binary, self.input_checkpoint_path,
                                  output_node_names, restore_op_name,
                                  filename_tensor_name, output_graph_path,
                                  clear_devices, False)
        
        # make XML
        self.createModelInformationXML()
        print('Freezing the model finished!')
        
        
class dotdict(dict):
    def __getattr__(self, name):
        return self[name]
       
            
if __name__ == '__main__':  
       
    print("Tensorflow version :", tf.__version__)

    args = dotdict({
#            'dataPath' : '../../../JKcloud/DB_JK/DAGM2007_dataset',
            'dataPath' : '../../../JKcloud/DB_JK/DAGM_dataset',
            'training' : False ,
            'load_model': True,                
            'load_folder_file': ('DAGM2_jkcnn1_32_12/','saved_checkpoint-0'), 
            'optimalAccuracyThreshold' : 0.98,
            'label_format' : 2,
            'classNoList' : [1,2,3,4,5,6],
            'feature_shape' : [32, 32, 1], # (H, W, C)
            'label_size' : 12,
            'nReDataExtraction' : 100,
            'nTrainingEpochs': 50,
            'batch_size' : 256,            
            'learning_rate' : 1e-4,  
            })
    
    import dagmCV2 as DAGM
    
#    dagm = DAGM.DAGM(args.dataPath)
    dagm = DAGM.DAGM(args.dataPath, label_format=args.label_format)
    commander = Commander(data=dagm, Model=network.Model, args=args)    
#    
    if(args.training==True):
        commander.train(nReDataExtraction=args.nReDataExtraction, training_epochs=args.nTrainingEpochs, batch_size=args.batch_size)    
        commander.freezeModel()
        
    elif(args.training==False): 
#        mode = int(input("1.training  |  2.accuracy test  |  3.Freeze a model  : "))
  
        commander._data.getBlockImages(blockH=args.feature_shape[0], blockW=args.feature_shape[1], 
                                      nOKperClass=1, nNGperClass=1, classNoList=args.classNoList, 
                                      label_type='array', isTrain=False)     
        commander.test(100) 

