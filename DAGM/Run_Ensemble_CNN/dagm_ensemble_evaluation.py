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
#from torch.utils.data import TensorDataset
#from torch.utils.data import DataLoader
from torch.autograd import Variable
#from pytorch_classification.utils import Bar, AverageMeter
#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
import matplotlib.pyplot as plt
import cv2


#sys.path.insert(0, 'networks')
sys.path.append("networks")  # parent directory
#sys.path.append("../JK")  # parent directory
#sys.path.insert(0, 'networks')

#import util_image
sys.path.append("../../ML_utils")  # parent directory
import JK_image

import visdom
vis = visdom.Visdom() 

def numpyToTorchVariable( array, isGPU=True):
    array_torch = torch.from_numpy(array)      
    if isGPU:
        array_torch = Variable(array_torch).cuda()
    else :
        array_torch = Variable(array_torch).cpu()
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
  
def detectDefectEnsenbleFCN( args, images):
  
    nImages = len(images)
    height = images[0].shape[0]
    width = images[0].shape[1] 
    
    resultFolderPath = "./Results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    
    
    Sigmoid = nn.Sigmoid()
    Relu = nn.ReLU()    
    Softmax = nn.Softmax()
        
    convNet = ""
    deconvNet = ""    
   
    
    fcn_results = np.zeros([nImages, height, width])
    

    for load_folder_file in args.load_folder_file_list: 
        modelPath = "preTrained_models/"+ load_folder_file[0] + "/" + load_folder_file[1] + '_all.pkl'
#        convParamsPath = "models/"+ load_folder_file[0] + "/" + load_folder_file[1] + 'convParams.pkl'
#        deconvParamsPath = "models/"+ load_folder_file[0] + "/" + load_folder_file[1] + 'deconvParams.pkl'
        print("Model path :", modelPath)
        print("========================================================")
        try:        
            convNet, deconvNet = torch.load(modelPath, map_location=lambda storage, location: storage) 
            print("===== Defect inspection by FCN.=====")
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
            print("\n--------There are no models.--------\n")
            pass
        print("========================================================")
         
        last_activation = load_folder_file[0][-2]
        print("last_activation :", last_activation)
            
        convNet.eval()
        deconvNet.eval()
        
        Xs = np.array(images, dtype=np.float32)/255.    
        Xs = Xs.reshape([-1,1,height,width])   
          
    #    XX = np.hstack([X[0], X[1]]).reshape([-1,1,512,2*512])
    #    X = XX
        numIter = math.ceil(nImages/args.batch_size)
        print("numIter :", numIter)
       
#        results = []
        for i in range(numIter):        
            X_np = Xs[(i*args.batch_size):((i+1)*args.batch_size)]
            X_tensor = torch.from_numpy(X_np)      
            if args.isGPU:
                X_var = Variable(X_tensor).cuda()
            else :
                X_var = Variable(X_tensor).cpu()
        
        #    X = numpyToTorchVariable(X, args.isGPU)
        
            output_var, indices, pool_sizes = convNet(X_var)
            output_var = deconvNet(output_var, indices, pool_sizes) 
#            if last_activation=='S':
#                output_var = Sigmoid(output_var)   
            
            if args.isGPU:
                output_var = output_var.cpu()
            
#            if i==0:
#                results = output_var
#            else:
#                results = torch.cat( (results, output_var), 0)

            outputSize = output_var.data.size()
            output_np = output_var.data.view(-1, outputSize[2], outputSize[3]).numpy()
                   
            output_np = plt.Normalize(vmin=np.amin(output_np), vmax=np.amax(output_np))(output_np)
#            print("max :", np.amax(output_np),  "min :", np.amin(output_np))
            vis.images(output_np.reshape([-1, 1, outputSize[2], outputSize[3]]), nrow=6)
    
        fcn_results[:] += output_np[:]
    
    fcn_results /= float(len(args.load_folder_file_list)) 
    
    vis.images(fcn_results.reshape([-1, 1, outputSize[2], outputSize[3]]), nrow=6)    
#            if i==0:
#                results = output_var
#            else:
#                results = torch.cat( (results, output_var), 0)
        #    if last_activation=='S':
        #        output = Sigmoid(output)   
        #        output = output.view([-1,1*512*512])
        #        print(output)
        #        output = Softmax (output)
        #        output = output.view([-1,1,512,512])
        
    #    print("Input size :", X_tensor.size())
    #    print("Output size :", Y_tensor.size())
    print("=======================================")
    print("===== FCN inspection is complete. =====")
    print("=======================================")
      
    return fcn_results # results.data  

    
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
        
        
    FCN_settings1 = dotdict({
            'dataPath' : "../../JKcloud/DB_JK/Shrinkage2D_dataset/GC25_S3C40",
            'DataForEval' : "DataForEvaluation",
            'isGPU' : False,         # False, # True,
            'isLabel' : True,
            'load_folder_file_list': [("DAGM_jkfcn2_SB",'DAGM_jkfcn2_SB'),
                                      ("DAGM_jkfcn10_SB",'DAGM_jkfcn10_SB'),
                                      ("DAGM_ResNetFCN1_SB",'DAGM_ResNetFCN1_SB'),
                                      ("DAGM_fcn1_SB",'DAGM_fcn1_SB')],            
            'setNameList' : ['S00296a'],
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
    
    # Defect inspection by FCN  
    fcn_results1 = detectDefectEnsenbleFCN(FCN_settings1, images) 
#    print(fcn_results.shape)
    
