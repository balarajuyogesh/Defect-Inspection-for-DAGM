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
#from xml.etree.ElementTree import Element, SubElement, dump, ElementTree

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
import matplotlib.pyplot as plt
#import cv2

sys.path.append("../../ML_utils")
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

def detectDefect( args, isResultSave=True):
   
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
    X_np = np.array(images, dtype=np.float32)/255.
    X_np = X_np.reshape([-1,1,height,width])    

    X = numpyToTorchVariable(X_np, args.isGPU)

    output = convNet(X)
    output = deconvNet(output)     

    if args.isGPU:
        output = output.cpu()
     
    output = output.data.numpy()
    outImages_np = output.reshape([-1, width, height])
    
    for i in range(nImages):  
        
        outputImg = outImages_np[i]
        
        # a colormap and a normalization instance
        cmap = plt.cm.jet
        norm = plt.Normalize(vmin=outputImg.min(), vmax=outputImg.max())                
        # map the normalized data to colors
        resultImg = cmap(norm(outputImg))
        
        if isResultSave:                
            filePath = resultFolderPath + 'output%d.png' % i
            plt.imsave(filePath, outputImg, cmap='gray')
            
            filePath = resultFolderPath + 'heatmap%d.png' % i
            plt.imsave(filePath, resultImg)                
    
        plt.subplot(1,3,1)    
        plt.imshow(images[i], cmap='gray') 
        plt.subplot(1,3,2)
        plt.imshow(outputImg, cmap='gray')
        plt.subplot(1,3,3)
        plt.imshow(resultImg)
        plt.show() 
        
        print("Input size :", X_np[i].shape)
        print("Output size :", output[i].shape)
        print("========================================================")
                   
    print("Input size :", X_np.shape)
    print("Output size :", output.shape)
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
            'folderPathForEval': "./DataForEval",
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
       
 
    detectDefect(args, isResultSave=True )  
        
        