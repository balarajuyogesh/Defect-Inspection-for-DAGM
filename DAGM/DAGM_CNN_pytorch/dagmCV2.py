#!/usr/bin/env python

import sys, os
sys.path.append(os.pardir)  # parent directory
#import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import matplotlib.gridspec as gridspec
from sklearn.feature_extraction import image
# from PIL import Image
import cv2
import glob
import random
import struct


# PIL_JK class includes PIL util made by JK

class Data(object):
    def __init__(self):
        self.images = np.zeros(1)
        self.labels = np.zeros(1)
        self.start_batch = 0
        self.end_batch = 0
        self.num_examples = 0
        
    def next_batch(self, batch_size):
        mini_batch = np.random.choice(len(self.images), batch_size, replace=False)
        
#        self.end_batch = self.start_batch+batch_size
#        mini_batch = np.arange(self.start_batch, self.end_batch)
#        if self.end_batch!=len(self.images):
#            self.start_batch = self.end_batch
#        else :
#            self.start_batch = 0
            
        return self.images[mini_batch], self.labels[mini_batch]
              

def genImgListWithFilename(folderpath, imgType, start, end): # input : path  # output : imgList   # path안의 이미지들을 리스트로 만들어준다.
        imgList = []    
        for i in range(start, end+1):
            filepath = folderpath+ '/' + str(i) + '.' + imgType                       
            image = cv2.imread(filepath, cv2.IMREAD_GRAYSCALE)  # B, G, R               
#            cv2.imshow('ddd',image)
#            cv2.waitKey(0)
            imgList.append(image)    
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

class DAGM(object):
    """
    
    """
    def __init__(self, dataPath, label_format=2):
        
        self.dataPath = dataPath
        
        self.label_size = 12
        
        self.label_folder = 'Label/'
        if label_format==3:
            self.label_folder = 'Label_new/'
        
        
        self.trainInfoC1_OK, self.trainInfoC1_NG = self.getDataInformation(1, True)
        self.testInfoC1_OK, self.testInfoC1_NG = self.getDataInformation(1, False)        
        self.trainInfoC2_OK, self.trainInfoC2_NG = self.getDataInformation(2, True)
        self.testInfoC2_OK, self.testInfoC2_NG = self.getDataInformation(2, False)        
        self.trainInfoC3_OK, self.trainInfoC3_NG = self.getDataInformation(3, True)
        self.testInfoC3_OK, self.testInfoC3_NG = self.getDataInformation(3, False)        
        self.trainInfoC4_OK, self.trainInfoC4_NG = self.getDataInformation(4, True)
        self.testInfoC4_OK, self.testInfoC4_NG = self.getDataInformation(4, False)        
        self.trainInfoC5_OK, self.trainInfoC5_NG = self.getDataInformation(5, True)
        self.testInfoC5_OK, self.testInfoC5_NG = self.getDataInformation(5, False)        
        self.trainInfoC6_OK, self.trainInfoC6_NG = self.getDataInformation(6, True)
        self.testInfoC6_OK, self.testInfoC6_NG = self.getDataInformation(6, False) 

        #readFreeImg()
        self.train = Data()
        self.test = Data()        
   
        
    def getDataInformation(self, classNo, isTrain):
        
        labelFolder = '/Test/Label/'
        if isTrain: 
            labelFolder = '/Train/' + self.label_folder
        
        classPath = self.dataPath + '/Class' + str(classNo)
        labelsPath = classPath + labelFolder
        
        imgInfoFile = open(labelsPath+'Labels.txt', 'r')  
        imgInfoBuffer = imgInfoFile.readline().split()
        OK_info = []
        NG_info = []
        for i in range(0, 575):
            imgInfoBuffer = imgInfoFile.readline().split()
#            print([classNo]+imgInfoBuffer)
            if imgInfoBuffer[1]=='0':
                OK_info.append([classNo]+imgInfoBuffer)
            elif imgInfoBuffer[1]=='1':
                NG_info.append([classNo]+imgInfoBuffer)

        return OK_info, NG_info
    
    
     
    def getBlockImages(self, blockH, blockW, nOKperClass=160, nNGperClass=160, classNoList=[1,2,3,4,5,6], label_type='image', isTrain=True):
        
        dataX = []
        dataY = []
        
        self.label_type = label_type   # image, index, or array
                
        for classNo in classNoList:
            X=[]
            Y=[]
            if classNo==1:
                if isTrain :
                    X, Y = self.extractBlocks(classNo, self.trainInfoC1_OK, self.trainInfoC1_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.extractBlocks(classNo, self.testInfoC1_OK, self.testInfoC1_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
               
            elif classNo==2:
                if isTrain :
                    X, Y = self.extractBlocks(classNo, self.trainInfoC2_OK, self.trainInfoC2_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.extractBlocks(classNo, self.testInfoC2_OK, self.testInfoC2_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
              
            elif classNo==3:
                if isTrain :
                    X, Y = self.extractBlocks(classNo, self.trainInfoC3_OK, self.trainInfoC3_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.extractBlocks(classNo, self.testInfoC3_OK, self.testInfoC3_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
               
            elif classNo==4:
                if isTrain :
                    X, Y = self.extractBlocks(classNo, self.trainInfoC4_OK, self.trainInfoC4_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.extractBlocks(classNo, self.testInfoC4_OK, self.testInfoC4_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
              
            elif classNo==5:
                if isTrain :
                    X, Y = self.extractBlocks(classNo, self.trainInfoC5_OK, self.trainInfoC5_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.extractBlocks(classNo, self.testInfoC5_OK, self.testInfoC5_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
              
            elif classNo==6:
                if isTrain :
                    X, Y = self.extractBlocks(classNo, self.trainInfoC6_OK, self.trainInfoC6_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.extractBlocks(classNo, self.testInfoC6_OK, self.testInfoC6_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
      
            dataX += X
            dataY += Y
            
        dataX = np.array(dataX, dtype=np.float32)
        if self.label_type=='image' or self.label_type=='array':
            dataY = np.array(dataY, dtype=np.float32)
        elif self.label_type=='index':
            dataY = np.array(dataY, dtype=np.int32)
        
        if isTrain:
            self.train.images = dataX
            self.train.labels = dataY
            self.train.num_examples = self.train.images.shape[0]
            print("Train images shape :", self.train.images.shape)
            print("Train labels shape :", self.train.labels.shape)
        else :
            self.test.images = dataX
            self.test.labels = dataY
            self.test.num_examples = self.test.images.shape[0]
            print("Test images shape :", self.test.images.shape)
            print("Test labels shape :", self.test.labels.shape)
 
    
      
    def extractBlocks(self, classNo, dataInfo_OK, dataInfo_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain=True ):
        
        X = []
        Y = []
        
        dataFolder = '/Test/'
        labelFolder = '/Test/Label/'
        if isTrain: 
            dataFolder = '/Train/'
            labelFolder = '/Train/' + self.label_folder
            
        classPath = self.dataPath + '/Class' + str(classNo)
        xDataPath = classPath + dataFolder
        yDataPath = classPath + labelFolder
        
        #====== OK
        random_batch = np.random.choice(len(dataInfo_OK), nOKperClass, replace=False)
        nBlockPerImage = 5
        tempY = np.zeros([blockW, blockH])
        for i in random_batch:
            imgInfoBuffer = dataInfo_OK[i]
#            print(imgInfoBuffer)
            Xpath = xDataPath + imgInfoBuffer[3]
            tempX = cv2.imread(Xpath, cv2.IMREAD_GRAYSCALE)  # B, G, R  
            try :
                tempX = image.extract_patches_2d(tempX, (blockW, blockH), max_patches=nBlockPerImage)  
            except:
                print(imgInfoBuffer)
                continue 
            
            for j in range(nBlockPerImage):
                X.append(tempX[j]/255.)
                    
                if self.label_type=='image':
                    Y.append(tempY/255.)
                    
                elif self.label_type=='index':                    
                   
                    if self.label_size==12:
                        Y.append(classNo-1)
                    elif self.label_size==13:
                        Y.append(classNo)
                        
                elif self.label_type=='array':
                    temp = np.zeros(self.label_size)
                    if self.label_size==12:
                        temp[classNo-1] = 1
                    elif self.label_size==13:
                        temp[classNo] = 1
                    Y.append(temp)
            
        #====== NG 
        if nNGperClass<8:
            nNGperClass=8   
        numNGperClass = int(nNGperClass/8)
        random_batch = np.random.choice(len(dataInfo_NG), numNGperClass, replace=False)
                
        for i in random_batch:
            imgInfoBuffer = dataInfo_NG[i]
            Xpath = xDataPath + imgInfoBuffer[3]
            Ypath = yDataPath + imgInfoBuffer[5]
            tempX = cv2.imread(Xpath, cv2.IMREAD_GRAYSCALE)  # B, G, R               
            tempY = cv2.imread(Ypath, cv2.IMREAD_GRAYSCALE)  # B, G, R 
            
            try:
                tempX.shape  
                tempY.shape
            except:
                print(imgInfoBuffer)
                continue
            
            w = tempX.shape[1]
            h = tempX.shape[0]
            defectPixels = []
            for y in range(h):
                for x in range(w):
                    if tempY[y,x]>0:
#                        print(y,x)
                        defectPixels.append((y,x))
            
            choicePixels = np.random.choice(len(defectPixels), nBlockPerImage, replace=False)        
            
            for j in choicePixels:
                y = int( defectPixels[j][0]-blockH/2 )
                x = int( defectPixels[j][1]-blockW/2 )
                if x<0:
                    x=0
                elif x>=w-blockW:
                    x=w-blockW-1
                if y<0:
                    y=0
                elif y>=h-blockH:
                    y=h-blockH-1
#                print(tempX[y,x])
                cropX = tempX[y:y+blockH, x:x+blockW]
                cropY = tempY[y:y+blockH, x:x+blockW]
#                print(cropX.shape)
#                plt.imshow(cropX, cmap='gray')
#                plt.show()
#                plt.imshow(cropY, cmap='gray')
#                plt.show()
                X += dataAugmentation(cropX/255.)
                if self.label_type=='image':
                    Y += dataAugmentation(cropY/255.)
                
                elif self.label_type=='index':
                    indexNo = None
                    if self.label_size==12:
                        indexNo = classNo+5
                    elif self.label_size==13:
                        indexNo = classNo+6
                        
                    for k in range(8):
                        Y.append(indexNo)                
                        
                elif self.label_type=='array':
                    temp = np.zeros(self.label_size)
                    
                    if self.label_size==12:
                        temp[classNo+5] = 1
                    elif self.label_size==13:
                        temp[classNo+6] = 1
                    
                    for k in range(8):
                        Y.append(temp)
        
        return X, Y
    
       
        
    
        
    ################################################======================================================================
      
    def getFullImages(self, sizeW, sizeH, nOKperClass=50, nNGperClass=50, classNoList=[1,2,3,4,5,6], isTrain=True):
        
        dataX = []
        dataY = []
        
        for classNo in classNoList:
            X = []
            Y = []
            if classNo==1:
                if isTrain :
                    X, Y = self.getRequestedClassFullImages(classNo, self.trainInfoC1_OK, self.trainInfoC1_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getRequestedClassFullImages(classNo, self.testInfoC1_OK, self.testInfoC1_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
            
            elif classNo==2:
                if isTrain :
                    X, Y = self.getRequestedClassFullImages(classNo, self.trainInfoC2_OK, self.trainInfoC2_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getRequestedClassFullImages(classNo, self.testInfoC2_OK, self.testInfoC2_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
          
            elif classNo==3:
                if isTrain :
                    X, Y = self.getRequestedClassFullImages(classNo, self.trainInfoC3_OK, self.trainInfoC3_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getRequestedClassFullImages(classNo, self.testInfoC3_OK, self.testInfoC3_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
            
            elif classNo==4:
                if isTrain :
                    X, Y = self.getRequestedClassFullImages(classNo, self.trainInfoC4_OK, self.trainInfoC4_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getRequestedClassFullImages(classNo, self.testInfoC4_OK, self.testInfoC4_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
        
            elif classNo==5:
                if isTrain :
                    X, Y = self.getRequestedClassFullImages(classNo, self.trainInfoC5_OK, self.trainInfoC5_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getRequestedClassFullImages(classNo, self.testInfoC5_OK, self.testInfoC5_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
            elif classNo==6:
                if isTrain :
                    X, Y = self.getRequestedClassFullImages(classNo, self.trainInfoC6_OK, self.trainInfoC6_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getRequestedClassFullImages(classNo, self.testInfoC6_OK, self.testInfoC6_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain)
            
            dataX += X
            dataY += Y

        dataX = np.array(dataX, dtype=np.float32)
        dataY = np.array(dataY, dtype=np.float32)
        
        if isTrain:
            self.train.images = dataX
            self.train.labels = dataY
            self.train.num_examples = self.train.images.shape[0]
            print("Train images shape :", self.train.images.shape)
            print("Train labels shape :", self.train.labels.shape)
        else :
            self.test.images = dataX
            self.test.labels = dataY
            self.test.num_examples = self.test.images.shape[0]
            print("Test images shape :", self.test.images.shape)
            print("Test labels shape :", self.test.labels.shape)
     

    
    
    
    def getBlocksForEval(self, blockH, blockW, nOKperClass=160, nNGperClass=160, classNoList=[1,2,3,4,5,6], label_type='image', isTrain=True):
        
        dataX = []
        dataY = []
        
        self.label_type = label_type   # image, index, or array
                
        for classNo in classNoList:
            X=[]
            Y=[]
            if classNo==1:
                if isTrain :
                    X, Y = self.getBlocks(classNo, self.trainInfoC1_OK, self.trainInfoC1_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getBlocks(classNo, self.testInfoC1_OK, self.testInfoC1_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
               
            elif classNo==2:
                if isTrain :
                    X, Y = self.getBlocks(classNo, self.trainInfoC2_OK, self.trainInfoC2_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getBlocks(classNo, self.testInfoC2_OK, self.testInfoC2_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
              
            elif classNo==3:
                if isTrain :
                    X, Y = self.getBlocks(classNo, self.trainInfoC3_OK, self.trainInfoC3_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getBlocks(classNo, self.testInfoC3_OK, self.testInfoC3_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
               
            elif classNo==4:
                if isTrain :
                    X, Y = self.getBlocks(classNo, self.trainInfoC4_OK, self.trainInfoC4_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getBlocks(classNo, self.testInfoC4_OK, self.testInfoC4_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
              
            elif classNo==5:
                if isTrain :
                    X, Y = self.getBlocks(classNo, self.trainInfoC5_OK, self.trainInfoC5_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getBlocks(classNo, self.testInfoC5_OK, self.testInfoC5_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
              
            elif classNo==6:
                if isTrain :
                    X, Y = self.getBlocks(classNo, self.trainInfoC6_OK, self.trainInfoC6_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
                else:
                    X, Y = self.getBlocks(classNo, self.testInfoC6_OK, self.testInfoC6_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain)
      
            dataX += X
            dataY += Y
            
        dataX = np.array(dataX, dtype=np.float32)
        if self.label_type=='image' or self.label_type=='array':
            dataY = np.array(dataY, dtype=np.float32)
        elif self.label_type=='index':
            dataY = np.array(dataY, dtype=np.int32)
        
        if isTrain:
            self.train.images = dataX
            self.train.labels = dataY
            self.train.num_examples = self.train.images.shape[0]
            print("Train images shape :", self.train.images.shape)
            print("Train labels shape :", self.train.labels.shape)
        else :
            self.test.images = dataX
            self.test.labels = dataY
            self.test.num_examples = self.test.images.shape[0]
            print("Test images shape :", self.test.images.shape)
            print("Test labels shape :", self.test.labels.shape)
 
    
      
    def getBlocks(self, classNo, dataInfo_OK, dataInfo_NG, blockW, blockH, nOKperClass, nNGperClass, isTrain=True ):
        
        X = []
        Y = []
        
        dataFolder = '/Test/'
        labelFolder = '/Test/Label/'
        if isTrain: 
            dataFolder = '/Train/'
            labelFolder = '/Train/' + self.label_folder
            
        classPath = self.dataPath + '/Class' + str(classNo)
        xDataPath = classPath + dataFolder
        yDataPath = classPath + labelFolder
        
        #====== OK
        random_batch = np.random.choice(len(dataInfo_OK), nOKperClass, replace=False)
        nBlockPerImage = 5
        tempY = np.zeros([blockW, blockH])
        for i in range(nOKperClass):
            imgInfoBuffer = dataInfo_OK[i]
#            print(imgInfoBuffer)
            Xpath = xDataPath + imgInfoBuffer[3]
            tempX = cv2.imread(Xpath, cv2.IMREAD_GRAYSCALE)  # B, G, R  
            try :
                tempX = image.extract_patches_2d(tempX, (blockW, blockH), max_patches=nBlockPerImage)  
            except:
                print(imgInfoBuffer)
                continue 
            
            for j in range(nBlockPerImage):
                X.append(tempX[j]/255.)
                    
                if self.label_type=='image':
                    Y.append(tempY/255.)
                    
                elif self.label_type=='index':                    
                   
                    if self.label_size==12:
                        Y.append(classNo-1)
                    elif self.label_size==13:
                        Y.append(classNo)
                        
                elif self.label_type=='array':
                    temp = np.zeros(self.label_size)
                    if self.label_size==12:
                        temp[classNo-1] = 1
                    elif self.label_size==13:
                        temp[classNo] = 1
                    Y.append(temp)
            
        #====== NG 
        if nNGperClass<8:
            nNGperClass=8   
        numNGperClass = int(nNGperClass/8)
        random_batch = np.random.choice(len(dataInfo_NG), numNGperClass, replace=False)
                
        for i in random_batch:
            imgInfoBuffer = dataInfo_NG[i]
            Xpath = xDataPath + imgInfoBuffer[3]
            Ypath = yDataPath + imgInfoBuffer[5]
            tempX = cv2.imread(Xpath, cv2.IMREAD_GRAYSCALE)  # B, G, R               
            tempY = cv2.imread(Ypath, cv2.IMREAD_GRAYSCALE)  # B, G, R 
            
            try:
                tempX.shape  
                tempY.shape
            except:
                print(imgInfoBuffer)
                continue
            
            w = tempX.shape[1]
            h = tempX.shape[0]
            defectPixels = []
            for y in range(h):
                for x in range(w):
                    if tempY[y,x]>0:
#                        print(y,x)
                        defectPixels.append((y,x))
            
            choicePixels = np.random.choice(len(defectPixels), nBlockPerImage, replace=False)        
            
            for j in choicePixels:
                y = int( defectPixels[j][0]-blockH/2 )
                x = int( defectPixels[j][1]-blockW/2 )
                if x<0:
                    x=0
                elif x>=w-blockW:
                    x=w-blockW-1
                if y<0:
                    y=0
                elif y>=h-blockH:
                    y=h-blockH-1
#                print(tempX[y,x])
                cropX = tempX[y:y+blockH, x:x+blockW]
                cropY = tempY[y:y+blockH, x:x+blockW]
#                print(cropX.shape)
#                plt.imshow(cropX, cmap='gray')
#                plt.show()
#                plt.imshow(cropY, cmap='gray')
#                plt.show()
                X += dataAugmentation(cropX/255.)
                if self.label_type=='image':
                    Y += dataAugmentation(cropY/255.)
                
                elif self.label_type=='index':
                    indexNo = None
                    if self.label_size==12:
                        indexNo = classNo+5
                    elif self.label_size==13:
                        indexNo = classNo+6
                        
                    for k in range(8):
                        Y.append(indexNo)                
                        
                elif self.label_type=='array':
                    temp = np.zeros(self.label_size)
                    
                    if self.label_size==12:
                        temp[classNo+5] = 1
                    elif self.label_size==13:
                        temp[classNo+6] = 1
                    
                    for k in range(8):
                        Y.append(temp)
        
        return X, Y
    
    
    
    def getRequestedClassFullImages(self, classNo, dataInfo_OK, dataInfo_NG, sizeW, sizeH, nOKperClass, nNGperClass, isTrain ):

        X = []
        Y = []
        
        dataFolder = '/Test/'
        labelFolder = '/Test/Label/'
        if isTrain: 
            dataFolder = '/Train/'
            labelFolder = '/Train/' + self.label_folder
            
        classPath = self.dataPath + '/Class' + str(classNo)
        xDataPath = classPath + dataFolder
        yDataPath = classPath + labelFolder
        
        random_batch = np.random.choice(len(dataInfo_OK), nOKperClass, replace=False)
        
        for i in random_batch:
            imgInfoBuffer = dataInfo_OK[i]
            Xpath = xDataPath + imgInfoBuffer[3]
            tempX = cv2.imread(Xpath, cv2.IMREAD_GRAYSCALE)  # B, G, R               
            tempX = cv2.resize(tempX, (sizeW, sizeH))          
#            print(imgInfoBuffer)
#            cv2.imshow('ddd', image)
#            cv2.waitKey(0)
            tempY = np.zeros([sizeW, sizeH])
            X.append(tempX/255.)
            Y.append(tempY/255.)
       
        if nNGperClass<8:
            nNGperClass=8            
        numNGperClass = int(nNGperClass/8)
        random_batch = np.random.choice(len(dataInfo_NG), numNGperClass, replace=False)
                
        for i in random_batch:
            imgInfoBuffer = dataInfo_NG[i]
            Xpath = xDataPath + imgInfoBuffer[3]
            tempX = cv2.imread(Xpath, cv2.IMREAD_GRAYSCALE)  # B, G, R               
            tempX = cv2.resize(tempX, (sizeW, sizeH))          
#            print(imgInfoBuffer)
#            cv2.imshow('ddd', image)
#            cv2.waitKey(0)
    
            Ypath = yDataPath + imgInfoBuffer[5]
            tempY = cv2.imread(Ypath, cv2.IMREAD_GRAYSCALE)  # B, G, R   
            tempY = cv2.resize(tempY, (sizeW, sizeH))
#                cv2.imshow('ddd', labeledImage)
#                cv2.waitKey(0)
            X += dataAugmentation(tempX/255.)
            Y += dataAugmentation(tempY/255.)
        
        return X, Y




  
    
if __name__ == '__main__':  
    

    dataPath = "../DAGM_dataset"  

        
    dagm = DAGM(dataPath)  
    dagm.getBlockImages(blockW=256, blockH=256, nOKperClass=1, nNGperClass=1, isTrain=False)
#    dagm.getFullImages( sizeW=300, sizeH=300, nOKperClass=1, nNGperClass=1, isTrain=False)
#    print(dagm.test.images[700])
    
    temp = dagm.test.images[0]
    plt.imshow(temp, cmap='gray')
    plt.show() 
    temp = dagm.test.labels[0]
    plt.imshow(temp, cmap='gray')
    plt.show() 

#    cv2.imshow('ddd', dagm.train.images[0])
#    cv2.waitKey(0)