#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue April 3 10:56:53 2018

UTIL for image processing (v0.1)

@author: Jaekyung Song
"""

import sys, os
#sys.path.append(os.pardir)  # parent directory
import numpy as np
import glob

#from mpl_toolkits.mplot3d import Axes3D
#from mpl_toolkits.mplot3d import proj3d
import matplotlib.pyplot as plt
import cv2
import visdom


def getImagesNumberOrder(path, format='png'): # input : path  # output : imgList   # path안의 이미지들을 리스트로 만들어준다.
    import re
    numbers = re.compile(r'(\d+)')
    def numericalSort(value):
        parts = numbers.split(value)
        parts[1::2] = map(int, parts[1::2])
        return parts

    imgList = []
    for filepath in sorted(glob.glob(path + "/*."+format), key=numericalSort):    # make a image list with images in path
#        img = Image.open(filepath)  
#        keep = img.copy()
#        imgList.append(keep)    
#        img.close()
        img = cv2.imread(filepath, cv2.IMREAD_GRAYSCALE)  # B, G, R   
        imgList.append(img)
    return imgList

def getImages(path, format='png'): # input : path  # output : imgList   
    imgList = []
    for filepath in glob.glob(path + "/*."+format):    # make a image list with images in path
#        img = Image.open(filepath)          
#        keep = img.copy()
#        imgList.append(keep)    
#        img.close()
        img = cv2.imread(filepath, cv2.IMREAD_GRAYSCALE)  # B, G, R   
        imgList.append(img)
    return imgList

def getImages2(path, format='PNG'): # input : path  # output : imgList   
    imgList = []
    for filepath in glob.glob(path + "/*."+format):    # make a image list with images in path
#        img = Image.open(filepath)          
#        keep = img.copy()
#        imgList.append(keep)    
#        img.close()
        img = cv2.imread(filepath, cv2.IMREAD_GRAYSCALE)  # B, G, R   
        imgList.append(img)
    return imgList

def cvRotateImg(img, angle):    
    rows = img.shape[0]
    cols = img.shape[1]
    M = cv2.getRotationMatrix2D((cols/2,rows/2),angle,1)
    image = cv2.warpAffine(img,M,(cols,rows))
    return image

# data augmentation                  
def dataAugmentation(image):
    Xli = []
    
    verticalFlip = cv2.flip(image,1)         # vertical flip                                 
    for i in range(1, 5):                    
        augmentedImg1 = cvRotateImg(image, 90*i)
        augmentedImg2 = cvRotateImg(verticalFlip, 90*i)
        Xli.append(augmentedImg1)        
        Xli.append(augmentedImg2)        
        
    return Xli


def HWC2toC2HW(image):        
    r = image[:,:,0]
    g = image[:,:,1]
    return np.array([r,g])    

def C2HWtoHWC2(image):            
    tempImg = np.zeros([image.shape[1], image.shape[2], image.shape[0]])
    tempImg[:,:,0] = image[0,:,:]
    tempImg[:,:,1] = image[1,:,:]
    return tempImg 

def HWC3toC3HW(image):        
    r, g, b = cv2.split(image)
#    r = image[:,:,0]
#    g = image[:,:,1]
#    b = image[:,:,2]
    return np.array([r,g,b])    

def HWC4toC3HW(image):        
    r, g, b, a = cv2.split(image)
#    r = image[:,:,0]
#    g = image[:,:,1]
#    b = image[:,:,2]
    return np.array([r,g,b])   

def C3HWtoHWC3(image):            
    r = image[0,:,:]
    g = image[1,:,:]
    b = image[2,:,:]
    return cv2.merge((r,g,b))

def GRAY2HeatMap(image):
    # a colormap and a normalization instance
    cmap = plt.cm.jet
    norm = plt.Normalize(vmin=image.min(), vmax=image.max())                
    heatmap =cmap(norm(image))
#    r, g, b, a = cv2.split(heatmap)    
#    return cv2.merge((r,g,b))
    return heatmap

   
        