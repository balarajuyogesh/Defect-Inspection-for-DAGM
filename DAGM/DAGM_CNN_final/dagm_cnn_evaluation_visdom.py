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
from xml.etree.ElementTree import Element, SubElement, dump, ElementTree

import numpy as np
import tensorflow as tf

#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
import matplotlib.pyplot as plt
import cv2
import visdom


sys.path.append("../../ML_utils")  # parent directory
import JK_image


import jknet1


#import matplotlib.animation as animation
#from sklearn.feature_extraction import image
#from PIL import Image
#sys.path.append("networks")  # parent directory


def detectDefectViaVisdom( args, result_type=1, isResultSave=True):
   
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
                
    images = np.array(images, dtype="float")    
    result_images = np.array(result_images, dtype="float")  
#    print(result_images.shape)
#    plt.imshow(result_images[0], cmap='gray')
    images = images.reshape([-1,1,512,512]) 
    result_images = result_images.reshape([-1,1,512,512])

    
    vis = visdom.Visdom()   
    
    if result_type==1:
          for i in range(nImages):
            vis.image(result_images[i])
            
    elif result_type==1:
#        results_tensor = torch.cat((X_tensor, Y_tensor), 0)  
        results = np.concatenate((images, result_images), axis=0) 
        vis.images(images, nrow=6)
        vis.images(result_images, nrow=6)
        vis.images(results, nrow=6)  
    
    #    kk = out_images.numpy().reshape(-1,512,512)
    #    heat = np.hstack([kk[0], kk[1]]).reshape([512,2*512])    
    #    vis.heatmap(heat)

    elif result_type==2:
        inputImages_np = X_tensor.numpy().reshape([-1, height, width])    
        outputImages_np = Y_tensor.numpy().reshape([-1, height, width])         
        for i in range(nImages):  
            inputImg = inputImages_np[i]  
            tempInput = JK_image.GRAY2CRGB(inputImg)
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
        
#    print("Input size :", X_tensor.size())
#    print("Output size :", Y_tensor.size())
    print("========================================================")
      
    
    
class dotdict(dict):
    def __getattr__(self, name):
        return self[name]

    

if __name__ == '__main__':  
    
    print("Tensorflow version :", tf.__version__)
    
    # GPU check

        
    args = dotdict({
            'isGPU' : False, #False, # True,
            'load_folder_file': ("DAGM_jknet1_32/",'saved_checkpoint-0'),  #("ForClass4_jkfcn3/",'ForClass4_jkfcn3'),  # 
            'folderPathForEval': "../DataForEvaluation",
            'feature_shape' : (32,32,1),
            })
    
    detectDefectViaVisdom(args, result_type=1)  
    
        
        