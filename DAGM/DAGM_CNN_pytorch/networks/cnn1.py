
# -*- coding: utf-8 -*-
"""
Created on Tue April 3 10:56:53 2018

Convolutional VAriational Autoencode

@author: Jaekyung Song
"""



import sys, os
sys.path.append(os.pardir)  # parent directory
#import numpy as np
#import time

import torch.nn as nn
import math

def conv3x3(in_planes, out_planes, stride=1):
    """3x3 convolution with padding"""
    return nn.Conv2d(in_planes, out_planes, kernel_size=3, stride=stride,
                     padding=1, bias=False)




class OneConvBlock(nn.Module):
    expansion = 1

    def __init__(self, inplanes, planes, stride=1):
        super(OneConvBlock, self).__init__()
        self.conv1 = nn.Conv2d(inplanes, planes, kernel_size=3, stride=stride,
                               padding=1, bias=False)
        self.bn1 = nn.BatchNorm2d(planes)
        self.relu = nn.ReLU(inplace=True)        
        self.stride = stride
        
    def forward(self, x):

        out = self.conv1(x)
        out = self.bn1(out)
        out = self.relu(out)

        return out

class ConvNetJK(nn.Module):

    def __init__(self, block, layers, k=1, input_size=(1,32,32), num_classes=12):
        self.inplanes = 1
        super(ConvNetJK, self).__init__()
         
#        self.maxPool = nn.MaxPool2d(kernel_size=3, stride=2, padding=1, return_indices=True)
        self.maxPool = nn.MaxPool2d(kernel_size=2, stride=2)  
        
        self.layer1 = self._make_layer(block, 16*k, layers[0], stride=1)
        self.layer2 = self._make_layer(block, 32*k, layers[1], stride=1)
        self.layer3 = self._make_layer(block, 64*k, layers[2], stride=1)
        self.layer4 = self._make_layer(block, 128*k, layers[3], stride=1)
                   
        h = int(input_size[1]/16)
        w = int(input_size[2]/16)
        self.fc1 = nn.Linear(128*k*h*w, 1024, bias=False)
        self.bn1 = nn.BatchNorm2d(1024)
        self.relu = nn.ReLU(inplace=True)
        
        self.fc2 = nn.Linear(1024, num_classes)
                
        for m in self.modules():
            if isinstance(m, nn.Conv2d):
                n = m.kernel_size[0] * m.kernel_size[1] * m.out_channels
                m.weight.data.normal_(0, math.sqrt(2. / n))
            elif isinstance(m, nn.BatchNorm2d):
                m.weight.data.fill_(1)
                m.bias.data.zero_()
                
#        for m in self.modules():
#            if isinstance(m, nn.Conv2d):
#                nn.init.kaiming_normal_(m.weight, mode='fan_out', nonlinearity='relu')
#            elif isinstance(m, nn.BatchNorm2d):
#                nn.init.constant_(m.weight, 1)
#                nn.init.constant_(m.bias, 0)

    def _make_layer(self, block, planes, blocks, stride=1):

        layers = []
        layers.append(block(self.inplanes, planes, stride))
        self.inplanes = planes * block.expansion
        for i in range(1, blocks):
            layers.append(block(self.inplanes, planes))

        return nn.Sequential(*layers)

    def forward(self, x, isGPU=True):                
        
        l1 = self.layer1(x)    
        
        pool1 = self.maxPool(l1)
#        print(pool1.size())
        l2 = self.layer2(pool1) 
        
        pool2 = self.maxPool(l2)
#        print(pool2.size()) 
        l3 = self.layer3(pool2)  
        
        pool3 = self.maxPool(l3)
        
        out = self.layer3(pool3)  
        
        out = self.maxPool(out)
#        print(pool3.size()) 
        out = out.view(out.size(0), -1) 
        out = self.fc1(out)
        out = self.bn1(out)
        out = self.relu(out)        
#        print(out.size())                
        out = self.fc2(out)

        return out

def Conv12k4(input_size, label_size, **kwargs):
    """Constructs a ResNet-18 model.
        
    Args:
       
    """
    model = ConvNetJK(OneConvBlock, [2, 3, 4, 3], k=4, input_size=input_size,
                      num_classes=label_size, **kwargs)    
    return model