# -*- coding: utf-8 -*-
"""
Created on Wed May 24 10:56:53 2017

@author: Jaekyung
"""
import sys, os
sys.path.append(os.pardir)  # parent directory
import tensorflow as tf
import numpy as np


tf.set_random_seed(777) # reproducibility


class Model:
    
    def __init__(self, sess, name, learning_rate=0.0001, feature_shape=[32,32,1], lable_size=12, weight_decay_rate=1e-5):
        self.sess = sess
        self._name = name
        self._learning_rate = learning_rate
        self._feature_shape = feature_shape
        self._lable_size = lable_size
                
        self.kernel_regularizer = tf.contrib.layers.l2_regularizer(scale=weight_decay_rate)
        
        self._build_net()
        
        
        
    def _build_net(self):        
        with tf.variable_scope(self._name):
            # dropout (keep_prob) rate  0.7~0.5 on training, but should be 1
            # for testing            
            self.training = tf.placeholder(tf.bool, name="training")

            # input place holders
            self.X = tf.placeholder( tf.float32, [None, self._feature_shape[0], self._feature_shape[1], self._feature_shape[2]], name="input")            
            self.Y = tf.placeholder(tf.float32, [None, self._lable_size])
                     
            # Convolutional Layer #2 and Pooling Layer #2
            l1 = tf.layers.conv2d(inputs=self.X, filters=64, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,30,30,64)            
            l1 = tf.layers.batch_normalization(l1, training=self.training)
            l1 = tf.nn.relu(l1)                        
            l1 = tf.layers.conv2d(inputs=l1, filters=64, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,30,30,64)            
            l1 = tf.layers.batch_normalization(l1, training=self.training)
            l1 = tf.nn.relu(l1)
            
            out = tf.layers.max_pooling2d(inputs=l1, pool_size=[2,2], padding="SAME", strides=2)               # (?,8,8,64)16            
#            dropout1 = tf.layers.dropout(inputs=pool1, rate=0.7, training=self.training)
            

            # Convolutional Layer #2 and Pooling Layer #3
            out = tf.layers.conv2d(inputs=out, filters=256, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
            
            out = tf.layers.conv2d(inputs=out, filters=256, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
            
            out = tf.layers.conv2d(inputs=out, filters=256, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
            
            out = tf.layers.max_pooling2d(inputs=out, pool_size=[2,2], padding="SAME", strides=2)               # (4,4)          
#            dropout2 = tf.layers.dropout(inputs=pool2, rate=0.7, training=self.training)
            
            
            
            # Convolutional Layer #2 and Pooling Layer #3
            out = tf.layers.conv2d(inputs=out, filters=512, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
           
            out = tf.layers.conv2d(inputs=out, filters=512, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
            
            out = tf.layers.conv2d(inputs=out, filters=512, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
 
            out = tf.layers.conv2d(inputs=out, filters=512, kernel_size=[3,3],
                                     padding="SAME", activation=None, use_bias=False,
                                     kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                     kernel_regularizer=self.kernel_regularizer)         # (?,15,15,256)            
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)
            
            out = tf.layers.max_pooling2d(inputs=out, pool_size=[2,2], padding="SAME", strides=2)              # (2,2)             
#            dropout3 = tf.layers.dropout(inputs=pool3, rate=0.7, training=self.training)
            
            # Dense Layer with Relu ========================================================================
            out = tf.reshape(out, [-1, 512*4*4])                              # 32-(?,4*4*128)  # 60-(?,8*8*128) 
    
            out = tf.layers.dense(inputs=out, units=1024, activation=None, use_bias=False,
                                  kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                  kernel_regularizer=self.kernel_regularizer)              # (?,1024)
            out = tf.layers.batch_normalization(out, training=self.training)
            out = tf.nn.relu(out)   
    
            self.logits = tf.layers.dense(inputs=out, units=self._lable_size, activation=None, 
                                          kernel_initializer=tf.contrib.layers.xavier_initializer(),
                                          kernel_regularizer=self.kernel_regularizer,
                                          bias_regularizer=self.kernel_regularizer)                # (?,13)
            
                    
        self.prob = tf.nn.softmax(self.logits, name="prob")
#        self.prob_argmax = tf.argmax(self.prob, 1, name="prob_argmax")
        self.result = tf.argmax(self.logits, 1, name="result")
#        self.probability = tf.max(self.prob, axis=1, name='probability')
                    
        # define cost/loss & optimizer
        self.cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(
            logits=self.logits, labels=self.Y))
        optimizer = tf.train.AdamOptimizer(learning_rate=self._learning_rate)
        self.train_op = ''
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)
        with tf.control_dependencies(update_ops):
            self.train_op = optimizer.minimize(self.cost, global_step=tf.train.get_global_step())

        correct_prediction = tf.equal(tf.argmax(self.logits, 1), tf.argmax(self.Y, 1))
        
        self.accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

    def predict(self, x_test, training=False):
        return self.sess.run(self.prob,
                             feed_dict={self.X: x_test, self.training: training})

    def get_accuracy(self, x_test, y_test, training=False):
        return self.sess.run(self.accuracy,
                             feed_dict={self.X: x_test,
                                        self.Y: y_test, self.training: training})

    def train(self, x_data, y_data, training=True):
        return self.sess.run([self.cost, self.train_op], feed_dict={
            self.X: x_data, self.Y: y_data, self.training: training})
