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

import sys, os
#sys.path.append(os.pardir)  # parent directory
import time
import glob
#from xml.etree.ElementTree import Element, SubElement, dump, ElementTree

import numpy as np
import math
# For Tensorflow
import tensorflow as tf


# For torch
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
sys.path.append("../DAGM_CNN_pytorch/networks")  # parent directory
sys.path.append("../DAGM_FCN_pytorch/networks")  # parent directory


#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
import matplotlib.pyplot as plt
import cv2
import visdom


sys.path.append("../../ML_utils")  # parent directory
import JK_image




#import matplotlib.animation as animation
#from sklearn.feature_extraction import image
#from PIL import Image
#sys.path.append("networks")  # parent directory

   

def resizedResult( blockSize, outputSize, probs, predictions):
    nRows = int(outputSize[0]//blockSize[0])
    nCols = int(outputSize[1]//blockSize[1])
    
    result = np.zeros([nRows,nCols])                
    for rowNo in range(nRows):
        for colNo in range(nCols):
            index = colNo+rowNo*nCols
            classNo = predictions[index]     
            if classNo>=6:
                result[colNo,rowNo] = probs[index] 
            else:
                result[colNo,rowNo] = 1.0-probs[index] 
    
    return cv2.resize(result, outputSize, interpolation=cv2.INTER_LINEAR) # INTER_CUBIC  INTER_LINEAR  INTER_AREA
    
#def resizedResult( blockSize, outputSize, probs, predictions):
#    nRows = int(outputSize[0]//blockSize[0])
#    nCols = int(outputSize[1]//blockSize[1])
#    
#    result = np.zeros([512,512])                
#    for rowNo in range(nRows):
#        for colNo in range(nCols):
#            index = colNo+rowNo*nCols
#            classNo = predictions[index]     
#            if classNo>=6:
#                result[32*colNo:32+32*colNo, 32*rowNo:32+32*rowNo] = probs[index] 
#            else:
#                result[32*colNo:32+32*colNo, 32*rowNo:32+32*rowNo] = 1.0-probs[index] 
#    
#    return result
   

def detectDefectCNN_tf( args, images):

    nImages = len(images)
    height = images[0].shape[0]
    width = images[0].shape[1] 
    
    blockH = args.feature_shape[0]
    blockW = args.feature_shape[1]
    blockC = args.feature_shape[2]
    
    resultFolderPath = "./Results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    
    model_dir = "../DAGM_CNN_final/models_tf/"
    if not os.path.exists(model_dir):
        os.mkdir(model_dir)    
    checkpoint_dir = model_dir + args.load_folder_file[0] + '/' 
    if not os.path.exists(model_dir):
        os.mkdir(model_dir)
#    latest_filename = "checkpoint_state"

    sess = tf.Session()
    sess.run(tf.global_variables_initializer())


    saved_graph_file = checkpoint_dir + args.load_folder_file[1] + '.meta'
    saver = tf.train.import_meta_graph(saved_graph_file)
    
    checkpoint = tf.train.get_checkpoint_state(checkpoint_dir, latest_filename="checkpoint_state")  
    print("|=============================================|")
    print("|===== Starting defect inspection by CNN =====|")
    print("|=============================================|")
    if checkpoint and checkpoint.model_checkpoint_path:
        saver.restore(sess, checkpoint.model_checkpoint_path)                
        print( checkpoint.model_checkpoint_path + " has been restored. =====")        
        
    elif False:
        raise Exception("Could not load checkpoints for playback")
    
    result_images = []
    for imgNo in range(nImages):
        
#        plt.imshow(images[imgNo], cmap='gray')
#        plt.show() 
        
        Xs = []
        tempX = images[imgNo]/255.
        for j in range(0, height, blockH):
            for i in range(0, width, blockW):                
#                print((i,i+blockW), (j,j+blockH))
                Xs.append(tempX[i:i+blockW, j:j+blockH])
    
    
        Xs = np.array(Xs, dtype=np.float32).reshape([-1, blockH, blockW, blockC])
        
        graph = tf.get_default_graph()
        training = graph.get_tensor_by_name("DAGM/training:0")
        inputs = graph.get_tensor_by_name("DAGM/input:0")
        probs = graph.get_tensor_by_name("prob:0")             
        Ys_prob = sess.run(probs, feed_dict={inputs:Xs, training:False})
#        results = graph.get_tensor_by_name("result:0")   
#        Ys = sess.run(results, feed_dict={ inputs:Xs, training:False})    
        
        Ys = np.argmax(Ys_prob, axis=1)
        probs_max = np.max(Ys_prob, axis=1)
#        print(Ys[200], probs_max[200])
#        Ys[np.where(Ys>=6)] = 1.0
#        Ys[np.where(Ys>=6)] = 1.0
#        Ys = Ys.reshape([16,16]).T
                
        resized_img = resizedResult((blockH,blockW), (512,512), probs_max, Ys)
        result_images.append( resized_img )
#        vis = visdom.Visdom() 
#        vis.image(resized_img)        
            
#        result_image = np.zeros([512,512])                
#        for i in range(16):
#            for j in range(16):
#                classNo = Ys[j+i*16] 
#                if classNo>=6:
#                    result_image[32*j:(32*j+32),32*i:(32*i+32)] = probs_max[j+i*16]
#        
#        result_images.append( result_image)                
       
    result_images = np.array(result_images, dtype="float")      
#    print(result_images.shape)
#    plt.imshow(result_images[0], cmap='gray')

#    print("Input size :", X_tensor.size())
#    print("Output size :", Y_tensor.size())
    print("|=======================================|")
    print("|===== CNN inspection is complete. =====|")
    print("|=======================================|")
    return result_images
      






def detectDefectCNN_Torch( args, images):

    nImages = len(images)
    height = images[0].shape[0]
    width = images[0].shape[1] 
    
    blockH = args.feature_shape[0]
    blockW = args.feature_shape[1]
    blockC = args.feature_shape[2]
    
    resultFolderPath = "./Results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    modelPath = "../DAGM_CNN_pytorch/models/"+ args.load_folder_file[0] + '/' + args.load_folder_file[1] + '_all.pkl'
    paramsPath = "../DAGM_CNN_pytorch/models/"+ args.load_folder_file[0] + '/' + args.load_folder_file[1] + 'convParams.pkl'
        
    sigmoid = nn.Sigmoid()
    softmax = nn.Softmax()
    
    network = ""
       
#    print("Model path :", modelPath)
        
    try:        
        network = torch.load(modelPath, map_location=lambda storage, location: storage) 
        print("|=============================================|")
        print("|===== Starting defect inspection by CNN =====|")
        print("|=============================================|")
        print( modelPath + " has been restored.")       
        
#        print("Conv parameters path :", convParamsPath)
#        network.load_state_dict(torch.load(paramsPath))      # it loads only the model parameters (recommended)  
#        print("\n--------" + paramsPath + " is restored--------\n")           
        if args.isGPU:
            network.cuda()
        else :
            network.cpu()                                
        
    except:
        print("|================================|")
        print("|===== There are no models. =====|")
        print("|================================|")
        pass  
        
    network.eval()
   
#    XX = np.hstack([X[0], X[1]]).reshape([-1,1,512,2*512])
#    X = XX
    results = []
    for imgNo in range(nImages):
        
#        plt.imshow(images[imgNo], cmap='gray')
#        plt.show() 
        
        
        Xs_np = []
        tempX = images[imgNo]/255.
        for j in range(0, height, blockH):
            for i in range(0, width, blockW):                
#                print((i,i+blockW), (j,j+blockH))
                Xs_np.append(tempX[i:i+blockW, j:j+blockH])    
    
        Xs_np = np.array(Xs_np, dtype=np.float32).reshape([-1, blockC, blockH, blockW])        
        Xs_tensor = torch.from_numpy(Xs_np)                 
        dataset = TensorDataset(data_tensor=Xs_tensor, target_tensor=Xs_tensor)        
        test_loader = DataLoader(dataset, batch_size=args.batch_size, shuffle=False)           

        total_probs = []
        total_predictions = []
        for k, [image,label] in enumerate(test_loader):
            
            Xs_var = Variable(image)       
#            label = Variable(label)                            
            
            if args.isGPU:
                Xs_var = Xs_var.cuda()
#                label = label.cuda() 
        
        
            output_var = network(Xs_var)
            output_var = softmax(output_var)
            
            if args.isGPU:
                Xs_var = Xs_var.cpu()
                output_var = output_var.cpu()
        
    #        vis = visdom.Visdom()
    #        vis.images(Xs_tensor, nrow=16)
    #        vis.images(output_var.data, nrow=16)
            
            probs, predictions = torch.max(output_var,1)
    #        print(probs, predictions)
            probs = probs.data.numpy()
            predictions = predictions.data.numpy()       
            
            if k==0:
                total_probs = probs
                total_predictions = predictions
            else:
                total_probs = np.concatenate( (total_probs, probs), axis=0 )
                total_predictions = np.concatenate( (total_predictions, predictions), axis=0)
                            
        resized_img = resizedResult((blockH,blockW), (512,512), total_probs, total_predictions)
        results.append( resized_img )
            
                           
    results = np.array(results, dtype="float")         

    print("|=======================================|")
    print("|===== CNN inspection is complete. =====|")
    print("|=======================================|")
      
    return results 



def detectDefectViaFCN( args, images):
    
    nImages = len(images)
    height = images[0].shape[0]
    width = images[0].shape[1] 
    
    blockH = args.feature_shape[0]
    blockW = args.feature_shape[1]
    blockC = args.feature_shape[2]
    
    resultFolderPath = "./Results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    modelPath = "../DAGM_FCN_pytorch/models/"+ args.load_folder_file[0] + '/' + args.load_folder_file[1] + '_all.pkl'
    convParamsPath = "../DAGM_FCN_pytorch/models/"+ args.load_folder_file[0] + '/' + args.load_folder_file[1] + 'convParams.pkl'
    deconvParamsPath = "../DAGM_FCN_pytorch/models/"+ args.load_folder_file[0] + '/' + args.load_folder_file[1] + 'deconvParams.pkl'
    
    Sigmoid = nn.Sigmoid()
    Softmax = nn.Softmax()
    last_activation = args.load_folder_file[0][-2]
    
    convNet = ""
    deconvNet = ""    
   
#    print("Model path :", modelPath)
        
    try:        
        convNet, deconvNet = torch.load(modelPath, map_location=lambda storage, location: storage) 
        print("|=============================================|")
        print("|===== Starting defect inspection by FCN =====|")
        print("|=============================================|")
        print( modelPath + " has been restored.")       
        
#        print("Conv parameters path :", convParamsPath)
#        print("Deconv parameters path :", deconvParamsPath)
#        convNet.load_state_dict(torch.load(convParamsPath))      # it loads only the model parameters (recommended)  
#        deconvNet.load_state_dict(torch.load(deconvParamsPath))      # it loads only the model parameters (recommended)
#        print("\n--------" + convParamsPath + " is restored--------\n")
#        print("\n--------" + deconvParamsPath + " is restored--------\n")        
        
        if args.isGPU:
            convNet.cuda()
            deconvNet.cuda()     
        else :
            convNet.cpu()
            deconvNet.cpu()                                       
        
    except:
        print("|================================|")
        print("|===== There are no models. =====|")
        print("|================================|")
        pass
  
        
    convNet.eval()
    deconvNet.eval()
    
    Xs = np.array(images, dtype=np.float32)/255.    
    Xs = Xs.reshape([-1,1,height,width])   
      
#    XX = np.hstack([X[0], X[1]]).reshape([-1,1,512,2*512])
#    X = XX



    results = []
    
#    nIter = int(nImages/args.batch_size)
#    for iterNo in range(nIter):
    for imgNo in range(nImages):
        
#        plt.imshow(images[imgNo], cmap='gray')
#        plt.show() 
        
        Xs = []
        tempX = images[imgNo]/255.
        for j in range(0, height, blockH):
            for i in range(0, width, blockW):                
#                print((i,i+blockW), (j,j+blockH))
                Xs.append(tempX[i:i+blockW, j:j+blockH])
    
    
        Xs = np.array(Xs, dtype=np.float32).reshape([-1, blockC, blockH, blockW])
        
        Xs_tensor = torch.from_numpy(Xs)      
        Xs_var = Variable(Xs_tensor)
        if args.isGPU:
            Xs_var = Xs_var.cuda()
            
    #    X = numpyToTorchVariable(X, args.isGPU)
    
        output_var, indices, pool_sizes = convNet(Xs_var)
        output_var = deconvNet(output_var, indices, pool_sizes)
        
        if args.isGPU:
#            Xs_var = Xs_var.cpu()
            output_var = output_var.cpu()
        
#        vis = visdom.Visdom()
#        vis.images(output_var.data, nrow=4)
        
        nRows = int(height//blockH)
        nCols = int(width//blockW)
        
        output_tensor = output_var.data
        
        result = []
        for rowNo in range(nRows):
            out = []
            for colNo in range(nCols):          
                if colNo==0:
                    out = output_tensor[colNo + nCols*rowNo]                
                else:
                    out = torch.cat( (out, output_tensor[colNo + nCols*rowNo]), 1)                
            
            if rowNo==0:
                result = out
            else:
                result = torch.cat( (result, out), 2)
        
#        print(result.size())
        
        result = result.view([-1, 1, height, width])
        if imgNo==0:
            results = result
        else:
            results = torch.cat( (results, result), 0)

    
        Xs_var = []
        output_var = []
#    print(results.size())
#    print("Input size :", X_tensor.size())
#    print("Output size :", Y_tensor.size())
    print("|=======================================|")
    print("|===== FCN inspection is complete. =====|")
    print("|=======================================|")
      
    return results






class dotdict(dict):
    def __getattr__(self, name):
        return self[name]



def showGray3(inputs, cnn_results, fcn_results):
    for i in range(3):
        inputImg = inputs[i]
        cnn_result = cnn_results[i]
        fcn_result = fcn_results[i]              
            
        plt.subplot(3,3,i+1)
        plt.imshow(inputImg, cmap='gray') 
        plt.subplot(3,3,i+4)    
        plt.imshow(cnn_result, cmap='gray')
        plt.subplot(3,3,i+7)    
        plt.imshow(fcn_result, cmap='gray')
    plt.show()
    
        
def showHeatMap3(inputs, cnn_results, fcn_results):
    for i in range(3):
        inputImg = inputs[i]
        cnn_result = cnn_results[i]
        fcn_result = fcn_results[i]              
            
        plt.subplot(3,3,i+1)
        plt.imshow(inputImg, cmap='gray') 
        plt.subplot(3,3,i+4)    
        plt.imshow(cnn_result)
        plt.subplot(3,3,i+7)    
        plt.imshow(fcn_result)
    plt.show()
    
    
    

if __name__ == '__main__':  
    
    print("Tensorflow version :", tf.__version__)
    print("PyTroch version :", torch.__version__)
    
    
    
    # GPU check
    visualizeTool = "visdom"  # matplotlib  |  visdom
    
    vis = ''
    if visualizeTool == "visdom":
        vis = visdom.Visdom() 
    
    
#    images = getImagesNumberOrder(args.folderPathForEval)
    images = JK_image.getImages2("./DataForEvaluation")
    height = images[0].shape[0]
    width = images[0].shape[1]
        
    # Defect inspection by CNN    
#    CNN_settings = dotdict({
#            'isGPU' : True, #False, # True,
#            'load_folder_file': ("DAGM2_jkcnn0_32_12",'saved_checkpoint-0'),  # ("ForClass4_jkfcn3/",'ForClass4_jkfcn3'),  #                         
#            'feature_shape' : (32,32,1),
#            })    
#    cnn_results = detectDefectCNN_tf(CNN_settings, images)
    
    
    CNN_settings = dotdict({
            'isGPU' : True, #False, # True,
            'load_folder_file': ("DAGM2_resnetJK0_resnet18v1_32_12",'recent'),  # ("ForClass4_jkfcn3/",'ForClass4_jkfcn3'),  # 
            'feature_shape' : (32,32,1),
            'batch_size' : 256
            })    
    cnn_results = detectDefectCNN_Torch(CNN_settings, images)
    
    
    # Defect inspection by FCN
    FCN_settings = dotdict({
            'isGPU' : True, #True, # True,            
            'load_folder_file': ("DAGM2_fcn0_c10d10_128_SB",'recent'),  #("ForClass4_jkfcn3/",'ForClass4_jkfcn3'),  # 
            'feature_shape' : (512,512,1),
            'batch_size' : 3,
            })    
    fcn_results = detectDefectViaFCN(FCN_settings, images)  
 
        
        
#    images = np.reshape(images, [-1, 1, height, width])    
#    vis.images(images, nrow=3)
#    cnn_results = np.reshape(cnn_results, [-1, 1, height, width])
#    vis.images(cnn_results, nrow=3)
#    vis.images(fcn_results, nrow=3)
    
    
    
    images = np.array(images, dtype=np.float32)/255.
    fcn_results = fcn_results.numpy().reshape([-1,height, width])    
      
    result_type_heatmap = True
    
    if result_type_heatmap:
        #===== Visualize color results ===========================================================================
        sys.path.append("../ML_utils")  # parent directory
        import JK_image    
        
        imagesC3 = []
        cnn_resultsC3 = []
        fcn_resultsC3 = []
        for i in range(images.shape[0]):
            
            if visualizeTool == "visdom":
                imagesC3.append( JK_image.HWC3toC3HW(cv2.cvtColor(images[i], cv2.COLOR_GRAY2RGB) ) ) 
                cnn_resultsC3.append( JK_image.HWC4toC3HW(JK_image.GRAY2HeatMap(cnn_results[i]) ) )
                fcn_resultsC3.append( JK_image.HWC4toC3HW(JK_image.GRAY2HeatMap(fcn_results[i]) ) )
            
            elif visualizeTool == "matplotlib":
                imagesC3.append( cv2.cvtColor(images[i], cv2.COLOR_GRAY2RGB) ) 
                cnn_resultsC3.append( JK_image.GRAY2HeatMap(cnn_results[i]) ) 
                fcn_resultsC3.append( JK_image.GRAY2HeatMap(fcn_results[i]) ) 
            
        
        imagesC3 = np.array(imagesC3, dtype='float')
        cnn_resultsC3 = np.array(cnn_resultsC3, dtype='float')
        fcn_resultsC3 = np.array(fcn_resultsC3, dtype='float')    
        
        if visualizeTool == "visdom":
            result_set1 = np.concatenate( ( np.concatenate((imagesC3[:3], cnn_resultsC3[:3]), axis=0), fcn_resultsC3[:3] ), axis=0)    
            result_set2 = np.concatenate( ( np.concatenate((imagesC3[3:], cnn_resultsC3[3:]), axis=0), fcn_resultsC3[3:]), axis=0)      
            vis.images(result_set1, nrow=3)
            vis.images(result_set2, nrow=3)
           
        elif visualizeTool == "matplotlib":
                
            showHeatMap3(imagesC3[:3], cnn_resultsC3[:3], fcn_resultsC3[:3])
            showHeatMap3(imagesC3[3:], cnn_resultsC3[3:], fcn_resultsC3[3:])
        
   
    else :
        
        #===== Visualize gray results ==========================================================================
        for i in range(6):
            fcn_result = fcn_results[i]              
            fcn_results[i] = plt.Normalize(vmin=np.amin(fcn_result), vmax=np.amax(fcn_result))(fcn_result) 
           
        
        if visualizeTool == "visdom":
            result_set1 = np.concatenate( ( np.concatenate((images[:3], cnn_results[:3]), axis=0) , fcn_results[:3] ), axis=0)        
            result_set2 = np.concatenate( ( np.concatenate((images[3:], cnn_results[3:]), axis=0), fcn_results[3:] ), axis=0)
            result_set1 = result_set1.reshape([-1,1,height, width])
            result_set2 = result_set2.reshape([-1,1,height, width])
            vis.images(result_set1, nrow=3)
            vis.images(result_set2, nrow=3)
        
        elif visualizeTool == "matplotlib":
            
            showGray3(images[:3], cnn_results[:3], fcn_results[:3])
            showGray3(images[3:], cnn_results[3:], fcn_results[3:])
            
    #    total_results = np.concatenate( (np.concatenate((images, cnn_results), axis=0), fcn_results), axis=0)
    #    total_results = total_results.reshape([-1,1,height, width])        
    #    vis.images(total_results, nrow=6)
    
    
    
 
#    total_results = np.concatenate( (np.concatenate((imagesC3, cnn_resultsC3), axis=0) , fcn_resultsC3), axis=0)       
#    vis.images(total_results, nrow=6)
    
    # free memory
    images = []
    cnn_results = []
    fcn_results = []
    imagesC3 = []
    cnn_resultsC3 = []
    fcn_resultsC3 = []