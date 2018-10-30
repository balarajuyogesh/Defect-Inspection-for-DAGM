#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 28 16:38:27 2018

@author: song
"""

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr 12 20:49:19 2018

@author: song
"""

# -*- coding: utf-8 -*-
"""
Created on Tue April 3 10:56:53 2018

Convolutional VAriational Autoencode

@author: Jaekyung Song
"""

import time, sys, os
sys.path.append(os.pardir)  # parent directory
import numpy as np
#from xml.etree.ElementTree import Element, SubElement, dump, ElementTree
#import tensorflow as tf
import torch
import torch.nn as nn
#import torch.optim as optim
#import torch.nn.init as init
#import torch.nn.functional as F
#import torchvision.datasets as dset
#import torchvision.transforms as transforms
from torch.utils.data import TensorDataset
from torch.utils.data import DataLoader
from torch.autograd import Variable
from pytorch_classification.utils import Bar, AverageMeter
#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
import matplotlib.pyplot as plt


sys.path.insert(0, 'networks')


from resnetJK0 import resnet34v1 as Network
#from cnn0 import Conv12k8 as Network

#import matplotlib.animation as animation
#from sklearn.feature_extraction import image
#from PIL import Image
#import glob
#import random

# torch.nn.Conv2d(in_channels, out_channels, kernel_size, stride=1, padding=0, dilation=1, groups=1, bias=True)      
# torch.nn.ConvTranspose2d(in_channels, out_channels, kernel_size, stride=1, padding=0, output_padding=0, groups=1, bias=True, dilation=1)
    
def weights_init(m):
    classname = m.__class__.__name__
#            print(classname) 
    if classname.find('Linear') != -1:
        nn.init.xavier_uniform(m.weight)
#                m.weight.data.normal_(0.0, 0.02)
        m.bias.data.normal_(0.0, 0.1)
        print("xavier_uniform")
        
    elif classname.find('Conv') != -1:
        nn.init.xavier_uniform(m.weight)
        m.bias.data.normal_(0.0, 0.1)
        print("xavier_uniform")
#        m.weight.data.normal_(0.0, 0.1)
        
    elif classname.find('BatchNorm') != -1:
        m.weight.data.normal_(1.0, 0.1)
        m.bias.data.fill_(0)

class Commander :
    
    def __init__(self, args, data):
        
        self.args = args
        self.data = data
        
        self.featureC = self.args.feature_shape[0]
        self.featureH = self.args.feature_shape[1] 
        self.featureW = self.args.feature_shape[2]
             
        self.modelFilePath = "models/"
#        self.modelFilePath = self.modelFilePath + self.args.load_folder_file[1] + "/"
#        if not os.path.exists(self.modelFilePath):
#            os.mkdir(self.modelFilePath)  
            
            
        self.resultFolderPath = "results/"
        if not os.path.exists(self.resultFolderPath):
            os.mkdir(self.resultFolderPath)  
           
        
        self.Sigmoid = nn.Sigmoid()
        self.softmax = nn.Softmax()        

        
    def recordTrainInformation(self, trainingEpochs, batchSize, minCost, maxAccuracy, elapsedTime):        
        note = Element("TrainingInformation")
        SubElement(note, "TrainingEpochs").text = str(trainingEpochs)
        SubElement(note, "BatchSize").text = str(batchSize)    
        SubElement(note, "MinCost").text = str(minCost)
        SubElement(note, "MaxAccuracy").text = str(maxAccuracy)
        SubElement(note, "ElapsedTime").text = str(elapsedTime)
#        dump(음표)                
#        ElementTree(음표).write(self.model_dir + "training_imformation.xml")
        
    def createModelInformationXML(self):        
        note = Element("ModelSetting")
        to = Element("ModelName")
        to.text = self._graphName    
        note.append(to)
#        SubElement(note, "FeatureWidth").text = str(self._featureShape[0])
#        SubElement(note, "FeatureHeight").text = str(self._featureShape[1])    
#        SubElement(note, "LabelSize").text = str(self._label_size)
#        dump(음표)                
#        ElementTree(음표).write(self.model_dir + self._graphName + ".xml")
#        
    
    def loadModel(self, path):
        
        network = 0
             
        try:                               
            network = torch.load(path, map_location=lambda storage, location: storage)                
#                self.network.load_state_dict(torch.load(self.loadParamsPath))      # it loads only the model parameters (recommended)  
#            print("--------" + path + " is restored--------")
            
        except:
            print("--------There are no models.--------")                
            pass
        
            
        if self.args.isGPU:
            network.cuda()
        else :
            network.cpu()
        
        return network
        
        
    def getCurrentAccuracy(self, net, batch_size, isTrainData=False):
        
        net.eval()
                
        channel = self.args.feature_shape[0]
        height = self.args.feature_shape[1]
        width = self.args.feature_shape[2]        

        dataset = self.data.test
        if isTrainData:
            dataset = self.data.train
                
        Xnp = dataset.images        
        Ynp = dataset.labels
                
        x = torch.from_numpy(Xnp.reshape([-1,channel,height,width]))        
        y = torch.from_numpy(Ynp)        
        
        test_loader = DataLoader(TensorDataset(data_tensor=x, target_tensor=y), 
                                 batch_size=batch_size, shuffle=True)           
               
        avg_accuracy = 0.0
        
#        tester = iter(test_loader)
#        for i in range(numIter):
#            Xs_tensor, Ys_tensor = tester.next()                
        numIter = 0
        for k, [Xs_tensor,Ys_tensor] in enumerate(test_loader):
            
#            Y = Y.view(-1,1)
#            print(Y)
            Xs_var = Variable(Xs_tensor, volatile=True)
            Ys_var = Variable(Ys_tensor, volatile=True)
                
            if self.args.isGPU:
                Xs_var = Xs_var.cuda()
                Ys_var = Ys_var.cuda()
    
            output_var = net(Xs_var)
            output_var = self.softmax(output_var)
            
            _, prediction = torch.max(output_var,1)
                
#            for k in range(batch_size):
#                plt.imshow(Xnp[k], cmap='gray')
#                plt.show()
#                plt.imsave( 'a.png', Xnp[k], cmap='gray')
#                print(prediction)
            
            accuracy = (prediction==Ys_var).double().sum()/output_var.size()[0]            
#            print(accuracy)
            if self.args.isGPU:
                accuracy = accuracy.cpu()
                
            avg_accuracy += accuracy.data.numpy()[0]
            numIter += 1
            
        avg_accuracy /= numIter
                
           

        return avg_accuracy
    
    
    
    def getEachModelAccuracy(self, modelList, isTrainData=False):
     
            
        for model in modelList:
            print('|========================================================|')
#            print( model)
            modelPath = self.modelFilePath + model[0] + "/"
#            print(modelPath)
            modelFilePath = modelPath + model[1] + '_all.pkl'            
#            print(modelFilePath)
            net = self.loadModel(modelFilePath)
            
            accuracy = self.getCurrentAccuracy( net, batch_size=self.args.batch_size, isTrainData=isTrainData)
            
                    
    #        print("Accuracy for training-data : %.1f" % (accuracy_train.data.numpy()[0]*100.), "%")
            print("|=====", modelFilePath, "=====|")
            print("|===== Accuracy : %.1f" % (accuracy*100.), "% ===========|")
            print('|========================================================|')

        return 0
           

    
    def getEnsembleAccuracy(self, model_list, Xs_var):
        ensemble_result = bool
        iterNo = 0
        for model in model_list:
            
            modelPath = self.modelFilePath + model[0] + "/"
            modelFilePath = modelPath + model[1] + "_all.pkl"
            net = self.loadModel(modelFilePath)
            net.eval()   
            output_var = net(Xs_var)
            output_var = self.softmax(output_var)
       
            if self.args.isGPU:
                output_var = output_var.cpu()
            
            if iterNo>0:
                ensemble_result += output_var
            else:
                ensemble_result = output_var
            
            iterNo += 1
            
        ensemble_result = ensemble_result/len(model)
        
        return ensemble_result
    
    
    def getEnsembleAccuracyForTest(self, model_list, batch_size, isTrainData=False):
        
        channel = self.args.feature_shape[0]
        height = self.args.feature_shape[1]
        width = self.args.feature_shape[2]        

        dataset = self.data.test
        if isTrainData:
            dataset = self.data.train
                
        Xnp = dataset.images        
        Ynp = dataset.labels
                
        x = torch.from_numpy(Xnp.reshape([-1,channel,height,width]))        
        y = torch.from_numpy(Ynp)        
        
        test_loader = DataLoader(TensorDataset(data_tensor=x, target_tensor=y), 
                                 batch_size=batch_size, shuffle=True)           
               
        avg_accuracy = 0.0
        
#        tester = iter(test_loader)
#        for i in range(numIter):
#            Xs_tensor, Ys_tensor = tester.next()                
        numIter = 0
       
        for k, [Xs_tensor,Ys_tensor] in enumerate(test_loader):
            
#            Y = Y.view(-1,1)
#            print(Y)
            Xs_var = Variable(Xs_tensor, volatile=True)
            Ys_var = Variable(Ys_tensor, volatile=True)
                
            if self.args.isGPU:
                Xs_var = Xs_var.cuda()
#                Ys_var = Ys_var.cuda()
                
            
            ensemble_result = self.getEnsembleAccuracy( model_list, Xs_var)
            
            
            if self.args.isGPU:
                ensemble_result = ensemble_result.cpu()
            
            _, prediction = torch.max(ensemble_result, 1)
            accuracy = (prediction==Ys_var).double().sum()/ensemble_result.size()[0]            
            
#            if self.args.isGPU:
#                accuracy = accuracy.cpu()
                
            avg_accuracy += accuracy.data.numpy()[0]
            numIter += 1
            
        avg_accuracy /= numIter
                
        print('|========================================================|')
        print('|========================================================|')
        print("|===== Ensemble accuracy : %.1f" % (avg_accuracy*100.), "% =====|")
        print('|========================================================|')
        print('|========================================================|')
        
        return avg_accuracy
    

class dotdict(dict):
    def __getattr__(self, name):
        return self[name]

    

if __name__ == '__main__':  
    
    print("Torch version :", torch.__version__)
    
    # GPU check
    useGPU = torch.cuda.is_available()
    
    if useGPU :
        deviceNo = torch.cuda.current_device()
        print("GPU_is_available.")
        print("DeviceNo :",  deviceNo)
        print(torch.cuda.device(deviceNo))
        print("Device_count :", torch.cuda.device_count())
#        print(torch.cuda.get_device_name(0))
#        print("Device_capability :", torch.cuda.get_device_capability(deviceNo))
#        print("Device_max_memory :", torch.cuda.max_memory_allocated(deviceNo))
#        print("Device_max_memory_cached :", torch.cuda.max_memory_cached(deviceNo))
        
    else :
        print("There are no GPU.")
        
        
    args = dotdict({
#            'dataPath' : '../../../JKcloud/DB_JK/DAGM2007_dataset',
            'dataPath' : '../../../JKcloud/DB_JK/DAGM_dataset',
            'isGPU' : True,         # False, # True,                
            'load_folder_file': [("DAGM2_resnetJK0_resnet18v1_32_12",'recent'),
                                 ("DAGM2_resnetJK0_resnet34v1_32_12",'recent'), # ("ForClass4_jkfcn3/",'ForClass4_jkfcn3'), (DAGM_jkfcn3/, jkfcn3)            
                                 ("DAGM2_resnetJK0_resnet50v1_32_12",'recent'),
                                 ("DAGM2_resnetJK0_resnet101v1_32_12",'recent'),
                                 ("DAGM2_resnetJK0_resnet152v1_32_12",'recent'),
                                 ("DAGM2_cnn0_Conv12k4_32_12",'recent'),
                                 ("DAGM2_cnn0_Conv12k8_32_12",'recent')],
            'featureType' : 'block',  # block \ full
            'label_format' : 2,
            'classNoList' : [1,2,3,4,5,6],
            'feature_shape' : [1, 32, 32], # channel, H, W  
            'label_size' : 12,  # index 0 : something we don't know          
            'batch_size' : 256,      
            })    
       
    if useGPU==False and args.isGPU==True:
        args.isGPU = False
        print("GPU is not availabe.")
    if args.isGPU==False:
        print("Runing by CPU")
    
    import dagmCV2 as DAGM

#    dagm = DAGM.DAGM(args.dataPath)    
    dagm = DAGM.DAGM(args.dataPath, label_format=args.label_format)  
    commander = Commander( args=args, data=dagm)      
    commander.data.getBlockImages(blockH=args.feature_shape[1], blockW=args.feature_shape[2], 
                                      nOKperClass=200, nNGperClass=200, classNoList=args.classNoList, 
                                      label_type='index', isTrain=False)
    
    commander.getEachModelAccuracy(modelList=args.load_folder_file, isTrainData=False)
    
    commander.getEnsembleAccuracyForTest(model_list=args.load_folder_file, 
                                  batch_size=args.batch_size, isTrainData=False)
 
#        if args.isGPU:
#            accuracy_test = accuracy_test.cpu()
    
#    print('=====================================================================')        
##        print("Accuracy for training-data : %.1f" % (accuracy_train.data.numpy()[0]*100.), "%")
#    print("Accuracy for test-data : %.1f" % (accuracy_test*100.), "%")
#    print('=====================================================================')   

    