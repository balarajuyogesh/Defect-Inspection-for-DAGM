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
import numpy as np
import time
import glob
from xml.etree.ElementTree import Element, SubElement, dump, ElementTree

import torch
#import torch.nn as nn
#import torch.optim as optim
#import torch.nn.init as init
#import torch.nn.functional as F
#import torchvision.datasets as dset
#import torchvision.transforms as transforms
#from torch.utils.data import TensorDataset
#from torch.utils.data import DataLoader
from torch.autograd import Variable

#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
#import matplotlib.pyplot as plt
import cv2
import visdom

sys.path.append("../../ML_utils")  # parent directory
import JK_image



#import matplotlib.animation as animation
#from sklearn.feature_extraction import image
#from PIL import Image
sys.path.append("networks")  # parent directory


def numpyToTorchVariable( array, isGPU=True):
    array_torch = torch.from_numpy(array)      
    if isGPU:
        array_torch = Variable(array_torch).cuda()
    else :
        array_torch = Variable(array_torch).cpu()
    return array_torch


def detectDefectViaVisdom( args, result_type=1, isResultSave=True):
   
    resultFolderPath = "./results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    modelPath = "models/"+ args.load_folder_file[0] + args.load_folder_file[1] + '_all.pkl'
    convParamsPath = "models/"+ args.load_folder_file[0] + args.load_folder_file[1] + 'convParams.pkl'
    deconvParamsPath = "models/"+ args.load_folder_file[0] + args.load_folder_file[1] + 'deconvParams.pkl'
    
    
    convNet = ""
    deconvNet = ""    
   
    try:
        print("Model path :", modelPath)
        convNet, deconvNet = torch.load(modelPath, map_location=lambda storage, location: storage)
        print("\n--------" + modelPath + " is restored--------\n")
        
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
        print("\n--------There are no models.--------\n")
        pass
     
        
    convNet.eval()
    deconvNet.eval()
    
#    images = getImagesNumberOrder(args.folderPathForEval)
    images = JK_image.getImages(args.folderPathForEval)
    nImages = len(images)
    height = images[0].shape[0]
    width = images[0].shape[1] 
    
    X = np.array(images, dtype=np.float32)/255.    
    X = X.reshape([-1,1,height,width])   
      
#    XX = np.hstack([X[0], X[1]]).reshape([-1,1,512,2*512])
#    X = XX
        
    X_tensor = torch.from_numpy(X)      
    if args.isGPU:
        X = Variable(X_tensor).cuda()
    else :
        X = Variable(X_tensor).cpu()

#    X = numpyToTorchVariable(X, args.isGPU)

    output = convNet(X)
    output = deconvNet(output)     

    if args.isGPU:
        output = output.cpu()
     
    Y_tensor = output.data    
    
    vis = visdom.Visdom()   
    
    if result_type==0:
        for i in range(nImages):
            vis.image(Y_tensor[i])
        
    elif result_type==1:
        
        results_tensor = torch.cat((X_tensor, Y_tensor), 0)  
        vis.images(X_tensor, nrow=6)  
        vis.images(Y_tensor, nrow=6)  
        vis.images(results_tensor, nrow=6)  
    
    #    kk = out_images.numpy().reshape(-1,512,512)
    #    heat = np.hstack([kk[0], kk[1]]).reshape([512,2*512])    
    #    vis.heatmap(heat)

    elif result_type==2:
        inputImages_np = X_tensor.numpy().reshape([-1, height, width])    
        outputImages_np = Y_tensor.numpy().reshape([-1, height, width])         
        for i in range(nImages):  
            inputImg = inputImages_np[i]  
#            tempInput = JK_image.GRAY2CRGB(inputImg)
            tempInput = cv2.cvtColor(inputImg, cv2.COLOR_GRAY2BGR)
            tempInput = JK_image.HWC3toC3HW(tempInput)
                    
            outputImg = outputImages_np[i]
            tempOutput = cv2.cvtColor(outputImg, cv2.COLOR_GRAY2BGR)
            tempOutput = JK_image.HWC3toC3HW(tempOutput)
            tempHeatmap = JK_image.GRAY2HeatMap(outputImg)
            
            tempInput = np.array(tempInput).reshape(-1, 3, height, width)
            tempOutput = np.array(tempOutput).reshape(-1, 3, height, width)
            tempHeatmap = np.array(tempHeatmap).reshape(-1, 3, height, width)
            
            result = np.concatenate((tempInput, tempOutput), axis=0)
            result = np.concatenate((result, tempHeatmap), axis=0)
            vis.images(result, nrow=6)
        
    
    elif result_type==3:
        inputImages_np = X_tensor.numpy().reshape([-1, height, width])    
        outputImages_np = Y_tensor.numpy().reshape([-1, height, width])         
#        inputImages = []
#        outputImages = []
#        heatmapImages = []
        resultImages = []
        for i in range(nImages):  
            
            inputImg = JK_image.HWC3toC3HW( cv2.cvtColor(inputImages_np[i], cv2.COLOR_GRAY2RGB) )
            outputGray = JK_image.HWC3toC3HW( cv2.cvtColor(outputImages_np[i] , cv2.COLOR_GRAY2RGB) )
            outputHeat = JK_image.GRAY2HeatMap(outputImages_np[i] )
            
            resultImg = np.concatenate((inputImg, outputGray), axis=0)
            resultImg = np.concatenate((resultImg, outputHeat), axis=0)            
            resultImages.append(resultImg)
            
#            inputImages.append( util_image.HWC3toC3HW( cv2.cvtColor(inputImg, cv2.COLOR_GRAY2RGB) )   )
#            outputImages.append( util_image.HWC3toC3HW( cv2.cvtColor(outputImg, cv2.COLOR_GRAY2RGB) )   )
#            heatmapImages.append( util_image.GRAY2HeatMap(outputImg) )
            
#        inputImages = np.array(inputImages).reshape(-1, 3, height, width)
#        outputImages = np.array(outputImages).reshape(-1, 3, height, width)
#        heatmapImages = np.array(heatmapImages).reshape(-1, 3, height, width)        
#        results = np.concatenate((inputImages, outputImages), axis=0)
#        results = np.concatenate((results, heatmapImages), axis=0)
#        vis.images(results, nrow=6)

        resultImages = np.array(resultImages).reshape(-1, 3, height, width)            
        vis.images(resultImages, nrow=3)
        
    print("Input size :", X_tensor.size())
    print("Output size :", Y_tensor.size())
    print("========================================================")
      
    
    
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
            'isGPU' : False, #False, # True,
            'load_folder_file': ("DAGM_jkfcn3/",'jkfcn3'),  #("ForClass4_jkfcn3/",'ForClass4_jkfcn3'),  # 
            'folderPathForEval': "../DataForEvaluation",
            })
    
    if useGPU==False and args.isGPU==True:
        args.isGPU = False
        print("GPU is not availabe.")
        
    if args.isGPU==False:
        print("Runing by CPU")
       
    if useGPU==False and args.isGPU==True:
        args.isGPU = False
        print("GPU is not availabe.")
    if args.isGPU==False:
        print("Runing by CPU")
       
    detectDefectViaVisdom(args, result_type=0)  
    
        
        