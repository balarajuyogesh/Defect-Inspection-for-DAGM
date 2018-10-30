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
import glob
sys.path.append(os.pardir)  # parent directory
import numpy as np
import math
#from xml.etree.ElementTree import Element, SubElement, dump, ElementTree
import tensorflow as tf
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
#from pytorch_classification.utils import Bar, AverageMeter
#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
import matplotlib.pyplot as plt
import cv2


#sys.path.insert(0, 'networks')
sys.path.append("networks")  # parent directory
#sys.path.append("../JK")  # parent directory
#sys.path.append("preTrained_models")
#sys.path.insert(0, 'networks')

#import util_image
#sys.path.append("../../ML_utils")  # parent directory
sys.path.append("..")
import JK_image 

def resizedResult( blockSize, outputSize, probs, predictions):
    nRows = int(outputSize[0]//blockSize[0])
    nCols = int(outputSize[1]//blockSize[1])
    blockH = blockSize[0]
    blockW = blockSize[1]
    height = outputSize[0]
    width = outputSize[1]
    
    result = np.zeros([height,width])                
    for colNo in range(0, nCols):
        for rowNo in range(0, nRows):                    
            index = rowNo+colNo*nRows
            classNo = predictions[index]     
            if classNo>=6:
                result[blockH*rowNo:blockH*(1+rowNo), blockW*colNo:blockW*(1+colNo)] = 1
    
    return cv2.resize(result, outputSize, interpolation=cv2.INTER_LINEAR) # INTER_CUBIC  INTER_LINEAR  INTER_AREA

def resizedResult2( blockSize, outputSize, probs, predictions):
    nRows = int(outputSize[0]//blockSize[0])
    nCols = int(outputSize[1]//blockSize[1])
    blockH = blockSize[0]
    blockW = blockSize[1]
    height = outputSize[0]
    width = outputSize[1]
    
    result = np.zeros([height,width])                
    for colNo in range(0, nCols):
        for rowNo in range(0, nRows):                    
            index = rowNo+colNo*nRows
            classNo = predictions[index]     
            if classNo>=6:
                result[blockH*rowNo:blockH*(1+rowNo), blockW*colNo:blockW*(1+colNo)] = probs[index]
    
    return cv2.resize(result, outputSize, interpolation=cv2.INTER_LINEAR) # INTER_CUBIC  INTER_LINEAR  INTER_AREA

def resizedResult3( blockSize, outputSize, probs, predictions):
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

def numpyToTorchVariable( array, isGPU=True):
    array_torch = torch.from_numpy(array)      
    if isGPU:
        array_torch = Variable(array_torch, volatile=True).cuda()
    else :
        array_torch = Variable(array_torch, volatile=True).cpu()
    return array_torch




def showResults(inputs, results):    
    #===== vizualize dataset =====#  
    nOutput = inputs.shape[0]
    for i in range(nOutput):  
        
        X = inputs[i]
        result = results[i]
                
        fig, (ax1, ax2) = plt.subplots(1,2, figsize=(8,4))
        p = ax1.pcolormesh(X)        
        p = ax2.pcolormesh(result)
        plt.show()
#        filePath = self.resultFolderPath + 'compared_result%d.png' % i
#        plt.imsave(filePath, buffer)
        
def showResultsWithLabels(inputs, labels, results):    
    #===== vizualize dataset =====#  
    nOutput = inputs.shape[0]
    for i in range(nOutput):  
        
        X = inputs[i]
        Y = labels[i]
        result = results[i]
                
        fig, (ax1, ax2, ax3) = plt.subplots(1,3, figsize=(12,4))
        p = ax1.pcolormesh(X)
        p = ax2.pcolormesh(Y)          
        p = ax3.pcolormesh(result)
        plt.show()
  
    
def loadModel( path, isGPU):
        
    network = 0         
    try:                               
        network = torch.load(path, map_location=lambda storage, location: storage)                
#                self.network.load_state_dict(torch.load(self.loadParamsPath))      # it loads only the model parameters (recommended)  
        print("--------" + path + " is restored--------")        
    except:
        print("--------There are no models.--------")                
        pass
    
        
    if isGPU:
        network.cuda()
    else :
        network.cpu()
    
    return network
    

def getEnsembleResultCNN(args, Xs):    
    Sigmoid = nn.Sigmoid()
    Softmax = nn.Softmax()
    result_var = 0
    iterNo = 0
    for model in args.load_folder_file:
        modelPath = "preTrained_models/"+ model[0] + "/" + model[1] + '_all.pkl'        
        net = loadModel(modelPath, args.isGPU)
        net.eval()
        
        output_var = net(Xs)
        output_var = Softmax(output_var)
        net = []        
        if iterNo>0:
            result_var += output_var
        else:
            result_var = output_var
            
        iterNo+=1
    
    result_var /= iterNo    
    if args.isGPU:
        result_var = result_var.cpu()            
        
    return result_var
    
def detectDefectEnsenbleCNN( args, image):
      
    height = image.shape[0]
    width = image.shape[1]
#    print(height, width)

    blockC = args.feature_size[0]
    blockH = args.feature_size[1]
    blockW = args.feature_size[2]
    
    
    resultFolderPath = "./Results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    

#    Xs = np.array(images, dtype=np.float32)/255.    
#    Xs = Xs.reshape([-1,1,height,width]) 
            
    Xs_np = []
    tempX = image/255.
    for j in range(0, height, blockH):
        for i in range(0, width, blockW):                
#                print((i,i+blockW), (j,j+blockH))
            Xs_np.append(tempX[i:i+blockW, j:j+blockH])    

    Xs_np = np.array(Xs_np, dtype=np.float32).reshape([-1, blockC, blockH, blockW])        
#    Xs_tensor = torch.from_numpy(Xs_np) 
#    dataset = TensorDataset(data_tensor=Xs_tensor, target_tensor=Xs_tensor)        
#    test_loader = DataLoader(dataset, batch_size=args.batch_size, shuffle=False)           
    
    total_probs = []
    total_predictions = []
#    for k, [Xs, Ys] in enumerate(test_loader):
        
    
    Xs_var = numpyToTorchVariable(Xs_np, isGPU=args.isGPU)
                        
    result_np = getEnsembleResultCNN(args, Xs_var)
    
    
    
    return result_np
    
    
class dotdict(dict):
    def __getattr__(self, name):
        return self[name]

    

if __name__ == '__main__':  
    
    print("Tensorflow version :", tf.__version__)
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
        
        
    settings1 = dotdict({
            'dataPath' : "../../../JKcloud/DB_JK/DAGM_dataset",
            'DataForEval' : "DataForEvaluation",
            'isGPU' : True,         # False, # True,
            'isLabel' : True,
            'load_folder_file': [("DAGM2_resnetJK0_resnet18v1_32_12",'recent'),
#                                 ("DAGM2_resnetJK0_resnet34v1_32_12",'recent'), # ("ForClass4_jkfcn3/",'ForClass4_jkfcn3'), (DAGM_jkfcn3/, jkfcn3)            
#                                 ("DAGM2_resnetJK0_resnet50v1_32_12",'recent'),
#                                 ("DAGM2_resnetJK0_resnet101v1_32_12",'recent'),
#                                 ("DAGM2_resnetJK0_resnet152v1_32_12",'recent'),
                                 ("DAGM2_cnn0_Conv12k4_32_12",'optimal0'),
                                 ("DAGM2_cnn0_Conv12k8_32_12",'recent')],           
            'feature_size' : [1, 32, 32],
            'batch_size' : 6,
            })
    

#    if useGPU==False and FCN_settings.isGPU==True:
#        FCN_settings.isGPU = False
#        print("GPU is not availabe.")
#        
#    if FCN_settings.isGPU==False:
#        print("Runing by CPU")
    
    images = JK_image.getImages2("./DataForEvaluation")
    height = images[0].shape[0]
    width = images[0].shape[1]


    blockC = settings1.feature_size[0]
    blockH = settings1.feature_size[1]
    blockW = settings1.feature_size[2]
    
    # Defect inspection by FCN  
    results = []
    for image in images:
        cnn_result = detectDefectEnsenbleCNN(settings1, image) 
        
        probs, predictions = torch.max(cnn_result, 1)
    #        print(probs, predictions)
        probs = probs.data.numpy()
        predictions = predictions.data.numpy()         
       
        resized_img = resizedResult3((blockH,blockW), (512,512), probs, predictions)
    
        results.append(resized_img)
        
    results = np.array(results, dtype="float") 
    

    
  
    #===== Visualize color results ===========================================================================
    import visdom
    vis = visdom.Visdom() 
    visualizeTool = "visdom"  # matplotlib  |  visdom    
    visualType = "heatmap"  # heatmap
      
    if visualType=="gray":
        results = np.reshape(results, [-1, 1, height, width])
        vis.images(results, nrow=3)
    
    elif visualType=="heatmap":
    
        results = np.reshape(results, [-1, height, width])
        imagesC3 = []
        cnn_resultsC3 = []
        fcn_resultsC3 = []
        for i in range(results.shape[0]):
    #        print(results[i].shape)
            if visualizeTool == "visdom":
    #            imagesC3.append( JK_image.HWC3toC3HW(cv2.cvtColor(images[i], cv2.COLOR_GRAY2RGB) ) ) 
                cnn_resultsC3.append( JK_image.HWC4toC3HW(JK_image.GRAY2HeatMap(results[i]) ) )
    #            fcn_resultsC3.append( JK_image.HWC4toC3HW(JK_image.GRAY2HeatMap(fcn_results[i]) ) )
            
            elif visualizeTool == "matplotlib":
    #            imagesC3.append( cv2.cvtColor(images[i], cv2.COLOR_GRAY2RGB) ) 
                cnn_resultsC3.append( JK_image.GRAY2HeatMap(results[i]) ) 
    #            fcn_resultsC3.append( JK_image.GRAY2HeatMap(fcn_results[i]) ) 
            
        
        imagesC3 = np.array(imagesC3, dtype='float')
        cnn_resultsC3 = np.array(cnn_resultsC3, dtype='float')
        fcn_resultsC3 = np.array(fcn_resultsC3, dtype='float')    
        
        
        if visualizeTool == "visdom":
    #        result_set1 = np.concatenate( ( np.concatenate((imagesC3[:3], cnn_resultsC3[:3]), axis=0), fcn_resultsC3[:3] ), axis=0)    
    #        result_set2 = np.concatenate( ( np.concatenate((imagesC3[3:], cnn_resultsC3[3:]), axis=0), fcn_resultsC3[3:]), axis=0)      
    #        vis.images(result_set1, nrow=3)
    #        vis.images(result_set2, nrow=3)
            vis.images(cnn_resultsC3, nrow=3)
           
        elif visualizeTool == "matplotlib":
                
            showHeatMap3(imagesC3[:3], cnn_resultsC3[:3], fcn_resultsC3[:3])
            showHeatMap3(imagesC3[3:], cnn_resultsC3[3:], fcn_resultsC3[3:])