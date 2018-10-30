#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue April 3 10:56:53 2018

UTIL for image processing

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


class Data(object):
    def __init__(self):
        self.Xs = np.zeros(1)
        self.Ys = np.zeros(1)
        self.start_batch = 0
        self.end_batch = 0
        self.num_examples = 0
        
    def next_batch(self, batch_size):
        mini_batch = np.random.choice(len(self.Xs), batch_size, replace=False)
        
#        self.end_batch = self.start_batch+batch_size
#        mini_batch = np.arange(self.start_batch, self.end_batch)
#        if self.end_batch!=len(self.images):
#            self.start_batch = self.end_batch
#        else :
#            self.start_batch = 0
            
        return self.Xs[mini_batch], self.Ys[mini_batch]
        