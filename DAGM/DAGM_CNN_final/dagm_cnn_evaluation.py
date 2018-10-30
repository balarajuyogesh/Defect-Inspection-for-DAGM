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

import tensorflow as tf
#import torch
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
import cv2

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

def detectDefect( args, result_type=1, isResultSave=True):
   
    #    images = getImagesNumberOrder(args.folderPathForEval)
    images = JK_image.getImages(args.folderPathForEval)
    nImages = len(images)
    height = images[0].shape[0]
    width = images[0].shape[1] 
    
    blockW = args.feature_shape[0]
    blockH = args.feature_shape[1]
    blockC = args.feature_shape[2]
    
    resultFolderPath = "./results/"
    if not os.path.exists(resultFolderPath):
        os.mkdir(resultFolderPath) 
    
    model_dir = "models_tensorflow/"
    if not os.path.exists(model_dir):
        os.mkdir(model_dir)    
    checkpoint_dir = model_dir + args.load_folder_file[0]
    if not os.path.exists(model_dir):
        os.mkdir(model_dir)
#    latest_filename = "checkpoint_state"

    sess = tf.Session()
    sess.run(tf.global_variables_initializer())


    saved_graph_file = checkpoint_dir + args.load_folder_file[1] + '.meta'
    saver = tf.train.import_meta_graph(saved_graph_file)
    
    checkpoint = tf.train.get_checkpoint_state(checkpoint_dir, latest_filename="checkpoint_state")    
    if checkpoint and checkpoint.model_checkpoint_path:
        saver.restore(sess, checkpoint.model_checkpoint_path)
        print("Loaded checkpoints %s" % checkpoint.model_checkpoint_path)
    elif False:
        raise Exception("Could not load checkpoints for playback")

    result_images = []
    total_results = []
    for imgNo in range(nImages):
        
#        plt.imshow(images[imgNo], cmap='gray')
#        plt.show() 
        
        Xs = []
        tempX = images[imgNo]/255.
        for j in range(0, height, blockH):
            for i in range(0, width, blockW):                
#                print((i,i+blockW), (j,j+blockH))
                Xs.append(tempX[i:i+blockW, j:j+blockH])
    
    
        Xs = np.array(Xs, dtype=np.float32).reshape([-1, blockW * blockH * blockC])
        
        graph = tf.get_default_graph()
        training = graph.get_tensor_by_name("DAGM/training:0")
        input = graph.get_tensor_by_name("DAGM/input:0")
#        result_prob = graph.get_tensor_by_name("prob:0")             
#        Ys_prob = sess.run(result_prob, feed_dict={input:Xs, training:False})
        result = graph.get_tensor_by_name("result:0")   
        Ys = sess.run(result, feed_dict={ input:Xs, training:False})        
        
#        Ys[np.where(Ys>=6)] = 1.0
#        Ys[np.where(Ys>=6)] = 1.0
#        Ys = Ys.reshape([16,16]).T
#        
#        result_image = np.full([16, 16], 0) 
        result_image = np.zeros([16,16])                
        for i in range(16):
            for j in range(16):
                classNo = Ys[j+i*16] 
                if classNo>=6:
                    result_image[j,i] = 1
                                     
        result_image = cv2.resize(result_image, (512,512), interpolation=cv2.INTER_LINEAR) # INTER_CUBIC  INTER_LINEAR  INTER_AREA
        result_images.append(result_image)
        
#        plt.imshow(result_image, cmap='gray')
#        plt.show() 
        if imgNo==0:
            total_results = result_image
        else:
            total_results = np.concatenate((total_results, result_image), axis=1)   
                
    images = np.array(images, dtype="float").reshape([-1,512,512]) 
    result_images = np.array(result_images, dtype="float").reshape([-1,512,512]) 
#    print(result_images.shape)
    plt.imshow(total_results, cmap='gray')
    plt.show()
    

#    print("Input size :", X_np.shape)
#    print("Output size :", output.shape)
#    print("========================================================")
   
    
    
class dotdict(dict):
    def __getattr__(self, name):
        return self[name]

    

if __name__ == '__main__':  
    
    print("Tensorflow version :", tf.__version__)
    
    # GPU check

        
    args = dotdict({
            'isGPU' : False, #False, # True,
            'load_folder_file': ("DAGM_jknet1_32/",'saved_checkpoint-0'),  #("ForClass4_jkfcn3/",'ForClass4_jkfcn3'),  # 
            'folderPathForEval': "./DataForEval",
            'feature_shape' : (32,32,1),
            })
       
 
    detectDefect(args, isResultSave=True )  
        
        