node {
  name: "DAGM/training"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "DAGM/input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 32
        }
        dim {
          size: 32
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "DAGM/Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 12
        }
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 6
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d/kernel"
  input: "DAGM/conv2d/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d/bias"
  input: "DAGM/conv2d/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/bias/read"
  op: "Identity"
  input: "DAGM/conv2d/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/Conv2D"
  op: "Conv2D"
  input: "DAGM/input"
  input: "DAGM/conv2d/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d/Conv2D"
  input: "DAGM/conv2d/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d/Relu"
  op: "Relu"
  input: "DAGM/conv2d/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 30
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_1/kernel"
  input: "DAGM/conv2d_1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_2/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_1/bias"
  input: "DAGM/conv2d_1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/Conv2D"
  op: "Conv2D"
  input: "DAGM/conv2d/Relu"
  input: "DAGM/conv2d_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_2/Conv2D"
  input: "DAGM/conv2d_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_2/Relu"
  op: "Relu"
  input: "DAGM/conv2d_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/max_pooling2d/MaxPool"
  op: "MaxPool"
  input: "DAGM/conv2d_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "DAGM/dropout/cond/Switch"
  op: "Switch"
  input: "DAGM/training"
  input: "DAGM/training"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout/cond/switch_t"
  op: "Identity"
  input: "DAGM/dropout/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout/cond/switch_f"
  op: "Identity"
  input: "DAGM/dropout/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout/cond/pred_id"
  op: "Identity"
  input: "DAGM/training"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/keep_prob"
  op: "Const"
  input: "^DAGM/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.30000001192092896
      }
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d/MaxPool"
  input: "DAGM/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/max_pooling2d/MaxPool"
      }
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/Shape"
  op: "Shape"
  input: "DAGM/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^DAGM/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^DAGM/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/dropout/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 58
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "DAGM/dropout/cond/dropout/random_uniform/max"
  input: "DAGM/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "DAGM/dropout/cond/dropout/random_uniform/RandomUniform"
  input: "DAGM/dropout/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/random_uniform"
  op: "Add"
  input: "DAGM/dropout/cond/dropout/random_uniform/mul"
  input: "DAGM/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/add"
  op: "Add"
  input: "DAGM/dropout/cond/dropout/keep_prob"
  input: "DAGM/dropout/cond/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/Floor"
  op: "Floor"
  input: "DAGM/dropout/cond/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/div"
  op: "RealDiv"
  input: "DAGM/dropout/cond/dropout/Shape/Switch:1"
  input: "DAGM/dropout/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/dropout/mul"
  op: "Mul"
  input: "DAGM/dropout/cond/dropout/div"
  input: "DAGM/dropout/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/Identity/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d/MaxPool"
  input: "DAGM/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/max_pooling2d/MaxPool"
      }
    }
  }
}
node {
  name: "DAGM/dropout/cond/Identity"
  op: "Identity"
  input: "DAGM/dropout/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout/cond/Merge"
  op: "Merge"
  input: "DAGM/dropout/cond/Identity"
  input: "DAGM/dropout/cond/dropout/mul"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 72
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_2/kernel"
  input: "DAGM/conv2d_2/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_3/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_2/bias"
  input: "DAGM/conv2d_2/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_3/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_3/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/Conv2D"
  op: "Conv2D"
  input: "DAGM/dropout/cond/Merge"
  input: "DAGM/conv2d_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_3/Conv2D"
  input: "DAGM/conv2d_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_3/Relu"
  op: "Relu"
  input: "DAGM/conv2d_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05103103816509247
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05103103816509247
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 96
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_3/kernel"
  input: "DAGM/conv2d_3/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_4/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_4/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_3/bias"
  input: "DAGM/conv2d_3/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_4/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_4/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/Conv2D"
  op: "Conv2D"
  input: "DAGM/conv2d_3/Relu"
  input: "DAGM/conv2d_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_4/Conv2D"
  input: "DAGM/conv2d_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_4/Relu"
  op: "Relu"
  input: "DAGM/conv2d_4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05103103816509247
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05103103816509247
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 120
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_4/kernel"
  input: "DAGM/conv2d_4/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_4/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_5/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_5/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_4/bias"
  input: "DAGM/conv2d_4/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_4/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_4/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_5/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_5/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/Conv2D"
  op: "Conv2D"
  input: "DAGM/conv2d_4/Relu"
  input: "DAGM/conv2d_4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_5/Conv2D"
  input: "DAGM/conv2d_4/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_5/Relu"
  op: "Relu"
  input: "DAGM/conv2d_5/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/max_pooling2d_2/MaxPool"
  op: "MaxPool"
  input: "DAGM/conv2d_5/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/Switch"
  op: "Switch"
  input: "DAGM/training"
  input: "DAGM/training"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/switch_t"
  op: "Identity"
  input: "DAGM/dropout_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/switch_f"
  op: "Identity"
  input: "DAGM/dropout_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/pred_id"
  op: "Identity"
  input: "DAGM/training"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/keep_prob"
  op: "Const"
  input: "^DAGM/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.30000001192092896
      }
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d_2/MaxPool"
  input: "DAGM/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/max_pooling2d_2/MaxPool"
      }
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/Shape"
  op: "Shape"
  input: "DAGM/dropout_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^DAGM/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^DAGM/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/dropout_2/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 151
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "DAGM/dropout_2/cond/dropout/random_uniform/max"
  input: "DAGM/dropout_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "DAGM/dropout_2/cond/dropout/random_uniform/RandomUniform"
  input: "DAGM/dropout_2/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/random_uniform"
  op: "Add"
  input: "DAGM/dropout_2/cond/dropout/random_uniform/mul"
  input: "DAGM/dropout_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/add"
  op: "Add"
  input: "DAGM/dropout_2/cond/dropout/keep_prob"
  input: "DAGM/dropout_2/cond/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/Floor"
  op: "Floor"
  input: "DAGM/dropout_2/cond/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/div"
  op: "RealDiv"
  input: "DAGM/dropout_2/cond/dropout/Shape/Switch:1"
  input: "DAGM/dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/dropout/mul"
  op: "Mul"
  input: "DAGM/dropout_2/cond/dropout/div"
  input: "DAGM/dropout_2/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/Identity/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d_2/MaxPool"
  input: "DAGM/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/max_pooling2d_2/MaxPool"
      }
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/Identity"
  op: "Identity"
  input: "DAGM/dropout_2/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_2/cond/Merge"
  op: "Merge"
  input: "DAGM/dropout_2/cond/Identity"
  input: "DAGM/dropout_2/cond/dropout/mul"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0416666679084301
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0416666679084301
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 165
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_5/kernel"
  input: "DAGM/conv2d_5/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_5/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_5/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_6/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_6/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_5/bias"
  input: "DAGM/conv2d_5/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_5/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_5/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_6/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_6/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/Conv2D"
  op: "Conv2D"
  input: "DAGM/dropout_2/cond/Merge"
  input: "DAGM/conv2d_5/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_6/Conv2D"
  input: "DAGM/conv2d_5/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_6/Relu"
  op: "Relu"
  input: "DAGM/conv2d_6/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 189
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_6/kernel"
  input: "DAGM/conv2d_6/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_6/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_6/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_7/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_7/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_6/bias"
  input: "DAGM/conv2d_6/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_6/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_6/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_7/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_7/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/Conv2D"
  op: "Conv2D"
  input: "DAGM/conv2d_6/Relu"
  input: "DAGM/conv2d_6/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_7/Conv2D"
  input: "DAGM/conv2d_6/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_7/Relu"
  op: "Relu"
  input: "DAGM/conv2d_7/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 213
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_7/kernel"
  input: "DAGM/conv2d_7/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_7/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_7/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_8/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_8/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_7/bias"
  input: "DAGM/conv2d_7/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_7/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_7/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_8/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_8/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/Conv2D"
  op: "Conv2D"
  input: "DAGM/conv2d_7/Relu"
  input: "DAGM/conv2d_7/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_8/Conv2D"
  input: "DAGM/conv2d_7/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_8/Relu"
  op: "Relu"
  input: "DAGM/conv2d_8/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\000\001\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03608439117670059
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03608439117670059
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 237
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/max"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/mul"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Assign"
  op: "Assign"
  input: "DAGM/conv2d_8/kernel"
  input: "DAGM/conv2d_8/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/read"
  op: "Identity"
  input: "DAGM/conv2d_8/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_8/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_9/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_9/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Assign"
  op: "Assign"
  input: "DAGM/conv2d_8/bias"
  input: "DAGM/conv2d_8/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/read"
  op: "Identity"
  input: "DAGM/conv2d_8/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/conv2d_8/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/conv2d_9/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/conv2d_9/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_9/Conv2D"
  op: "Conv2D"
  input: "DAGM/conv2d_8/Relu"
  input: "DAGM/conv2d_8/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_9/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/conv2d_9/Conv2D"
  input: "DAGM/conv2d_8/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/conv2d_9/Relu"
  op: "Relu"
  input: "DAGM/conv2d_9/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/max_pooling2d_3/MaxPool"
  op: "MaxPool"
  input: "DAGM/conv2d_9/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/Switch"
  op: "Switch"
  input: "DAGM/training"
  input: "DAGM/training"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/switch_t"
  op: "Identity"
  input: "DAGM/dropout_3/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/switch_f"
  op: "Identity"
  input: "DAGM/dropout_3/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/pred_id"
  op: "Identity"
  input: "DAGM/training"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/keep_prob"
  op: "Const"
  input: "^DAGM/dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.30000001192092896
      }
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d_3/MaxPool"
  input: "DAGM/dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/max_pooling2d_3/MaxPool"
      }
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/Shape"
  op: "Shape"
  input: "DAGM/dropout_3/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^DAGM/dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^DAGM/dropout_3/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/dropout_3/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 268
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "DAGM/dropout_3/cond/dropout/random_uniform/max"
  input: "DAGM/dropout_3/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "DAGM/dropout_3/cond/dropout/random_uniform/RandomUniform"
  input: "DAGM/dropout_3/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/random_uniform"
  op: "Add"
  input: "DAGM/dropout_3/cond/dropout/random_uniform/mul"
  input: "DAGM/dropout_3/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/add"
  op: "Add"
  input: "DAGM/dropout_3/cond/dropout/keep_prob"
  input: "DAGM/dropout_3/cond/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/Floor"
  op: "Floor"
  input: "DAGM/dropout_3/cond/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/div"
  op: "RealDiv"
  input: "DAGM/dropout_3/cond/dropout/Shape/Switch:1"
  input: "DAGM/dropout_3/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/dropout/mul"
  op: "Mul"
  input: "DAGM/dropout_3/cond/dropout/div"
  input: "DAGM/dropout_3/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/Identity/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d_3/MaxPool"
  input: "DAGM/dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/max_pooling2d_3/MaxPool"
      }
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/Identity"
  op: "Identity"
  input: "DAGM/dropout_3/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dropout_3/cond/Merge"
  op: "Merge"
  input: "DAGM/dropout_3/cond/Identity"
  input: "DAGM/dropout_3/cond/dropout/mul"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\000\020\000\000"
      }
    }
  }
}
node {
  name: "DAGM/Reshape"
  op: "Reshape"
  input: "DAGM/dropout_3/cond/Merge"
  input: "DAGM/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03423266112804413
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03423266112804413
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/dense/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 284
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/dense/kernel/Initializer/random_uniform/max"
  input: "DAGM/dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/dense/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/dense/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/dense/kernel/Initializer/random_uniform/mul"
  input: "DAGM/dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense/kernel/Assign"
  op: "Assign"
  input: "DAGM/dense/kernel"
  input: "DAGM/dense/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense/kernel/read"
  op: "Identity"
  input: "DAGM/dense/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/dense/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/dense/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense/bias/Assign"
  op: "Assign"
  input: "DAGM/dense/bias"
  input: "DAGM/dense/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense/bias/read"
  op: "Identity"
  input: "DAGM/dense/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/dense/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/dense/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/dense/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense/MatMul"
  op: "MatMul"
  input: "DAGM/Reshape"
  input: "DAGM/dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "DAGM/dense/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/dense/MatMul"
  input: "DAGM/dense/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/dense/Relu"
  op: "Relu"
  input: "DAGM/dense/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\000\004\000\000"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05412658676505089
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05412658676505089
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 307
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/max"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/mul"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Assign"
  op: "Assign"
  input: "DAGM/dense_1/kernel"
  input: "DAGM/dense_1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/read"
  op: "Identity"
  input: "DAGM/dense_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/dense_2/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/dense_2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Assign"
  op: "Assign"
  input: "DAGM/dense_1/bias"
  input: "DAGM/dense_1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_1/bias/read"
  op: "Identity"
  input: "DAGM/dense_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/dense_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/dense_2/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/dense_2/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/MatMul"
  op: "MatMul"
  input: "DAGM/dense/Relu"
  input: "DAGM/dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "DAGM/dense_2/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/dense_2/MatMul"
  input: "DAGM/dense_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "DAGM/dense_2/Relu"
  op: "Relu"
  input: "DAGM/dense_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\004\000\000\014\000\000\000"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07610194385051727
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07610194385051727
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 777
    }
  }
  attr {
    key: "seed2"
    value {
      i: 330
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/max"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/RandomUniform"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/mul"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Assign"
  op: "Assign"
  input: "DAGM/dense_2/kernel"
  input: "DAGM/dense_2/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/read"
  op: "Identity"
  input: "DAGM/dense_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/dense_3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/dense_3/kernel/Regularizer/l2_regularizer/scale"
  input: "DAGM/dense_3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Assign"
  op: "Assign"
  input: "DAGM/dense_2/bias"
  input: "DAGM/dense_2/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_2/bias/read"
  op: "Identity"
  input: "DAGM/dense_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_3/bias/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-06
      }
    }
  }
}
node {
  name: "DAGM/dense_3/bias/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "DAGM/dense_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_3/bias/Regularizer/l2_regularizer"
  op: "Mul"
  input: "DAGM/dense_3/bias/Regularizer/l2_regularizer/scale"
  input: "DAGM/dense_3/bias/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_3/MatMul"
  op: "MatMul"
  input: "DAGM/dense_2/Relu"
  input: "DAGM/dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "DAGM/dense_3/BiasAdd"
  op: "BiasAdd"
  input: "DAGM/dense_3/MatMul"
  input: "DAGM/dense_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "prob"
  op: "Softmax"
  input: "DAGM/dense_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "result/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "result"
  op: "ArgMax"
  input: "DAGM/dense_3/BiasAdd"
  input: "result/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "Shape"
  op: "Shape"
  input: "DAGM/dense_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Rank_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "Shape_1"
  op: "Shape"
  input: "DAGM/dense_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sub"
  op: "Sub"
  input: "Rank_1"
  input: "Sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Slice/begin"
  op: "Pack"
  input: "Sub"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Slice"
  op: "Slice"
  input: "Shape_1"
  input: "Slice/begin"
  input: "Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "concat/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "concat"
  op: "ConcatV2"
  input: "concat/values_0"
  input: "Slice"
  input: "concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "DAGM/dense_3/BiasAdd"
  input: "concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Rank_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "Shape_2"
  op: "Shape"
  input: "DAGM/Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Sub_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sub_1"
  op: "Sub"
  input: "Rank_2"
  input: "Sub_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Slice_1/begin"
  op: "Pack"
  input: "Sub_1"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Slice_1/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Slice_1"
  op: "Slice"
  input: "Shape_2"
  input: "Slice_1/begin"
  input: "Slice_1/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "concat_1/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "concat_1"
  op: "ConcatV2"
  input: "concat_1/values_0"
  input: "Slice_1"
  input: "concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_1"
  op: "Reshape"
  input: "DAGM/Placeholder"
  input: "concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "SoftmaxCrossEntropyWithLogits"
  op: "SoftmaxCrossEntropyWithLogits"
  input: "Reshape"
  input: "Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Sub_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sub_2"
  op: "Sub"
  input: "Rank"
  input: "Sub_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Slice_2/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Slice_2/size"
  op: "Pack"
  input: "Sub_2"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Slice_2"
  op: "Slice"
  input: "Shape"
  input: "Slice_2/begin"
  input: "Slice_2/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_2"
  op: "Reshape"
  input: "SoftmaxCrossEntropyWithLogits"
  input: "Slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean"
  op: "Mean"
  input: "Reshape_2"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/Fill"
  input: "gradients/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape"
  op: "Shape"
  input: "Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Tile"
  op: "Tile"
  input: "gradients/Mean_grad/Reshape"
  input: "gradients/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_1"
  op: "Shape"
  input: "Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/Shape_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_1"
  input: "gradients/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/Mean_grad/Shape_2"
  input: "gradients/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/Mean_grad/Prod_1"
  input: "gradients/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/Mean_grad/Prod"
  input: "gradients/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mean_grad/Shape_1"
      }
    }
  }
}
node {
  name: "gradients/Mean_grad/Cast"
  op: "Cast"
  input: "gradients/Mean_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/Mean_grad/Tile"
  input: "gradients/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Reshape_2_grad/Shape"
  op: "Shape"
  input: "SoftmaxCrossEntropyWithLogits"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mean_grad/truediv"
  input: "gradients/Reshape_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_like"
  op: "ZerosLike"
  input: "SoftmaxCrossEntropyWithLogits:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims"
  op: "ExpandDims"
  input: "gradients/Reshape_2_grad/Reshape"
  input: "gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/SoftmaxCrossEntropyWithLogits_grad/mul"
  op: "Mul"
  input: "gradients/SoftmaxCrossEntropyWithLogits_grad/ExpandDims"
  input: "SoftmaxCrossEntropyWithLogits:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Reshape_grad/Shape"
  op: "Shape"
  input: "DAGM/dense_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/SoftmaxCrossEntropyWithLogits_grad/mul"
  input: "gradients/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Reshape_grad/Reshape"
  input: "^gradients/DAGM/dense_3/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/dense_3/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Reshape_grad/Reshape"
  input: "^gradients/DAGM/dense_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Reshape_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dense_3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/dense_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_3/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/DAGM/dense_3/BiasAdd_grad/tuple/control_dependency"
  input: "DAGM/dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "DAGM/dense_2/Relu"
  input: "gradients/DAGM/dense_3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dense_3/MatMul_grad/MatMul"
  input: "^gradients/DAGM/dense_3/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/DAGM/dense_3/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dense_3/MatMul_grad/MatMul"
  input: "^gradients/DAGM/dense_3/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_3/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_3/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dense_3/MatMul_grad/MatMul_1"
  input: "^gradients/DAGM/dense_3/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_3/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/dense_3/MatMul_grad/tuple/control_dependency"
  input: "DAGM/dense_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/dense_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dense_2/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/dense_2/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/dense_2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dense_2/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/dense_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_2/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dense_2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/dense_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/DAGM/dense_2/BiasAdd_grad/tuple/control_dependency"
  input: "DAGM/dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "DAGM/dense/Relu"
  input: "gradients/DAGM/dense_2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dense_2/MatMul_grad/MatMul"
  input: "^gradients/DAGM/dense_2/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/DAGM/dense_2/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dense_2/MatMul_grad/MatMul"
  input: "^gradients/DAGM/dense_2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_2/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense_2/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dense_2/MatMul_grad/MatMul_1"
  input: "^gradients/DAGM/dense_2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense_2/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/dense_2/MatMul_grad/tuple/control_dependency"
  input: "DAGM/dense/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dense/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/dense/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/dense/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dense/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/dense/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/dense/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dense/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/dense/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dense/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/dense/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/DAGM/dense/BiasAdd_grad/tuple/control_dependency"
  input: "DAGM/dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/dense/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "DAGM/Reshape"
  input: "gradients/DAGM/dense/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dense/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dense/MatMul_grad/MatMul"
  input: "^gradients/DAGM/dense/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/DAGM/dense/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dense/MatMul_grad/MatMul"
  input: "^gradients/DAGM/dense/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dense/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dense/MatMul_grad/MatMul_1"
  input: "^gradients/DAGM/dense/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dense/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/DAGM/Reshape_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout_3/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dense/MatMul_grad/tuple/control_dependency"
  input: "gradients/DAGM/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/DAGM/Reshape_grad/Reshape"
  input: "DAGM/dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/Reshape_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout_3/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/DAGM/dropout_3/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout_3/cond/Merge_grad/cond_grad"
  input: "^gradients/DAGM/dropout_3/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/Reshape_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout_3/cond/Merge_grad/cond_grad:1"
  input: "^gradients/DAGM/dropout_3/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/Reshape_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout_3/cond/dropout/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "DAGM/dropout_3/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Shape"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/mul"
  op: "Mul"
  input: "gradients/DAGM/dropout_3/cond/Merge_grad/tuple/control_dependency_1"
  input: "DAGM/dropout_3/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/mul"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Sum"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "DAGM/dropout_3/cond/dropout/div"
  input: "gradients/DAGM/dropout_3/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/mul_1"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Sum_1"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape"
  input: "^gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape"
  input: "^gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_3/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch"
  op: "Switch"
  input: "DAGM/max_pooling2d_3/MaxPool"
  input: "DAGM/dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_1"
  op: "Shape"
  input: "gradients/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros"
  op: "Fill"
  input: "gradients/Shape_1"
  input: "gradients/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/DAGM/dropout_3/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout_3/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Shape"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/RealDiv"
  op: "RealDiv"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/control_dependency"
  input: "DAGM/dropout_3/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Sum"
  op: "Sum"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/RealDiv"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Sum"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Neg"
  op: "Neg"
  input: "DAGM/dropout_3/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Neg"
  input: "DAGM/dropout_3/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/RealDiv_1"
  input: "DAGM/dropout_3/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/mul"
  op: "Mul"
  input: "gradients/DAGM/dropout_3/cond/dropout/mul_grad/tuple/control_dependency"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Sum_1"
  op: "Sum"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/mul"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Sum_1"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape"
  input: "^gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape_1"
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape"
  input: "^gradients/DAGM/dropout_3/cond/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/div_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape_1"
  input: "^gradients/DAGM/dropout_3/cond/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_3/cond/dropout/div_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_1"
  op: "Switch"
  input: "DAGM/max_pooling2d_3/MaxPool"
  input: "DAGM/dropout_3/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_2"
  op: "Shape"
  input: "gradients/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_1"
  op: "Fill"
  input: "gradients/Shape_2"
  input: "gradients/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_3/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/DAGM/dropout_3/cond/dropout/div_grad/tuple/control_dependency"
  input: "gradients/zeros_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/DAGM/dropout_3/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/DAGM/dropout_3/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_3/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/max_pooling2d_3/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "DAGM/conv2d_9/Relu"
  input: "DAGM/max_pooling2d_3/MaxPool"
  input: "gradients/AddN"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/max_pooling2d_3/MaxPool_grad/MaxPoolGrad"
  input: "DAGM/conv2d_9/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_9/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_9/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_9/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_9/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_9/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_9/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_9/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/conv2d_8/Relu"
  input: "DAGM/conv2d_8/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_9/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_8/kernel/read"
  input: "gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/conv2d_8/Relu"
  input: "gradients/DAGM/conv2d_9/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_9/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_9/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_9/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_9/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_9/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/conv2d_9/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/conv2d_8/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_8/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_8/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_8/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_8/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_8/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_8/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_8/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/conv2d_7/Relu"
  input: "DAGM/conv2d_7/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_8/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_7/kernel/read"
  input: "gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/conv2d_7/Relu"
  input: "gradients/DAGM/conv2d_8/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_8/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_8/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_8/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_8/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_8/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/conv2d_8/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/conv2d_7/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_7/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_7/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_7/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_7/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_7/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_7/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_7/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/conv2d_6/Relu"
  input: "DAGM/conv2d_6/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_7/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_6/kernel/read"
  input: "gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/conv2d_6/Relu"
  input: "gradients/DAGM/conv2d_7/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_7/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_7/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_7/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_7/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_7/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/conv2d_7/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/conv2d_6/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_6/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_6/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_6/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_6/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_6/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/dropout_2/cond/Merge"
  input: "DAGM/conv2d_5/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_6/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_5/kernel/read"
  input: "gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/dropout_2/cond/Merge"
  input: "gradients/DAGM/conv2d_6/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_6/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_6/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_6/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_6/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/DAGM/conv2d_6/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout_2/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/DAGM/dropout_2/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout_2/cond/Merge_grad/cond_grad"
  input: "^gradients/DAGM/dropout_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout_2/cond/Merge_grad/cond_grad:1"
  input: "^gradients/DAGM/dropout_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_6/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout_2/cond/dropout/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "DAGM/dropout_2/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Shape"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/mul"
  op: "Mul"
  input: "gradients/DAGM/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  input: "DAGM/dropout_2/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/mul"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Sum"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "DAGM/dropout_2/cond/dropout/div"
  input: "gradients/DAGM/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/mul_1"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Sum_1"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape"
  input: "^gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape"
  input: "^gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_2/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_2"
  op: "Switch"
  input: "DAGM/max_pooling2d_2/MaxPool"
  input: "DAGM/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_3"
  op: "Shape"
  input: "gradients/Switch_2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_2"
  op: "Fill"
  input: "gradients/Shape_3"
  input: "gradients/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/DAGM/dropout_2/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Shape"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/RealDiv"
  op: "RealDiv"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/control_dependency"
  input: "DAGM/dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Sum"
  op: "Sum"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/RealDiv"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Sum"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Neg"
  op: "Neg"
  input: "DAGM/dropout_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Neg"
  input: "DAGM/dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/RealDiv_1"
  input: "DAGM/dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/mul"
  op: "Mul"
  input: "gradients/DAGM/dropout_2/cond/dropout/mul_grad/tuple/control_dependency"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Sum_1"
  op: "Sum"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/mul"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Sum_1"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape"
  input: "^gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape_1"
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape"
  input: "^gradients/DAGM/dropout_2/cond/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/div_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape_1"
  input: "^gradients/DAGM/dropout_2/cond/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_2/cond/dropout/div_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_3"
  op: "Switch"
  input: "DAGM/max_pooling2d_2/MaxPool"
  input: "DAGM/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_4"
  op: "Shape"
  input: "gradients/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_3"
  op: "Fill"
  input: "gradients/Shape_4"
  input: "gradients/zeros_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout_2/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/DAGM/dropout_2/cond/dropout/div_grad/tuple/control_dependency"
  input: "gradients/zeros_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/DAGM/dropout_2/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/DAGM/dropout_2/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout_2/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/max_pooling2d_2/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "DAGM/conv2d_5/Relu"
  input: "DAGM/max_pooling2d_2/MaxPool"
  input: "gradients/AddN_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/max_pooling2d_2/MaxPool_grad/MaxPoolGrad"
  input: "DAGM/conv2d_5/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_5/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_5/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_5/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_5/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_5/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_5/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_5/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/conv2d_4/Relu"
  input: "DAGM/conv2d_4/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_5/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_4/kernel/read"
  input: "gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/conv2d_4/Relu"
  input: "gradients/DAGM/conv2d_5/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_5/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_5/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_5/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_5/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_5/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/conv2d_5/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/conv2d_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_4/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_4/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_4/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_4/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_4/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_4/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_4/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/conv2d_3/Relu"
  input: "DAGM/conv2d_3/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_4/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_3/kernel/read"
  input: "gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/conv2d_3/Relu"
  input: "gradients/DAGM/conv2d_4/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_4/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_4/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_4/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_4/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_4/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/conv2d_4/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/conv2d_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_3/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_3/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_3/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/dropout/cond/Merge"
  input: "DAGM/conv2d_2/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_3/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_2/kernel/read"
  input: "gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/dropout/cond/Merge"
  input: "gradients/DAGM/conv2d_3/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_3/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_3/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/DAGM/conv2d_3/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/DAGM/dropout/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout/cond/Merge_grad/cond_grad"
  input: "^gradients/DAGM/dropout/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout/cond/Merge_grad/cond_grad:1"
  input: "^gradients/DAGM/dropout/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout/cond/dropout/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "DAGM/dropout/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Shape"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/mul"
  op: "Mul"
  input: "gradients/DAGM/dropout/cond/Merge_grad/tuple/control_dependency_1"
  input: "DAGM/dropout/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/mul"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Sum"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "DAGM/dropout/cond/dropout/div"
  input: "gradients/DAGM/dropout/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/mul_1"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Sum_1"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape"
  input: "^gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape"
  input: "^gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_4"
  op: "Switch"
  input: "DAGM/max_pooling2d/MaxPool"
  input: "DAGM/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_5"
  op: "Shape"
  input: "gradients/Switch_4:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_4"
  op: "Fill"
  input: "gradients/Shape_5"
  input: "gradients/zeros_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/DAGM/dropout/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Shape"
  op: "Shape"
  input: "DAGM/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Shape"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/RealDiv"
  op: "RealDiv"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/control_dependency"
  input: "DAGM/dropout/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Sum"
  op: "Sum"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/RealDiv"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Reshape"
  op: "Reshape"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Sum"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Neg"
  op: "Neg"
  input: "DAGM/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Neg"
  input: "DAGM/dropout/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/RealDiv_1"
  input: "DAGM/dropout/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/mul"
  op: "Mul"
  input: "gradients/DAGM/dropout/cond/dropout/mul_grad/tuple/control_dependency"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Sum_1"
  op: "Sum"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/mul"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Sum_1"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/dropout/cond/dropout/div_grad/Reshape"
  input: "^gradients/DAGM/dropout/cond/dropout/div_grad/Reshape_1"
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Reshape"
  input: "^gradients/DAGM/dropout/cond/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout/cond/dropout/div_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/div_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/Reshape_1"
  input: "^gradients/DAGM/dropout/cond/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout/cond/dropout/div_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_5"
  op: "Switch"
  input: "DAGM/max_pooling2d/MaxPool"
  input: "DAGM/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_6"
  op: "Shape"
  input: "gradients/Switch_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_5/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_5"
  op: "Fill"
  input: "gradients/Shape_6"
  input: "gradients/zeros_5/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/dropout/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/DAGM/dropout/cond/dropout/div_grad/tuple/control_dependency"
  input: "gradients/zeros_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/DAGM/dropout/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/DAGM/dropout/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/dropout/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/max_pooling2d/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "DAGM/conv2d_2/Relu"
  input: "DAGM/max_pooling2d/MaxPool"
  input: "gradients/AddN_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/max_pooling2d/MaxPool_grad/MaxPoolGrad"
  input: "DAGM/conv2d_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_2/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_2/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_2/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_2/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/conv2d/Relu"
  input: "DAGM/conv2d_1/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d_2/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d_1/kernel/read"
  input: "gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/conv2d/Relu"
  input: "gradients/DAGM/conv2d_2/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d_2/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d_2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d_2/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d_2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d_2/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/DAGM/conv2d_2/Conv2D_grad/tuple/control_dependency"
  input: "DAGM/conv2d/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/DAGM/conv2d/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/DAGM/conv2d/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d/Relu_grad/ReluGrad"
  input: "^gradients/DAGM/conv2d/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/DAGM/conv2d/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "DAGM/input"
  input: "DAGM/conv2d/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/DAGM/conv2d/Conv2D_grad/ShapeN"
  input: "DAGM/conv2d/kernel/read"
  input: "gradients/DAGM/conv2d/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "DAGM/input"
  input: "gradients/DAGM/conv2d/Conv2D_grad/ShapeN:1"
  input: "gradients/DAGM/conv2d/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "gradients/DAGM/conv2d/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/DAGM/conv2d/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/DAGM/conv2d/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/DAGM/conv2d/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/DAGM/conv2d/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta1_power/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta1_power/read"
  op: "Identity"
  input: "beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta2_power/Assign"
  op: "Assign"
  input: "beta2_power"
  input: "beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta2_power/read"
  op: "Identity"
  input: "beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 1
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d/kernel/Adam"
  input: "DAGM/conv2d/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 1
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d/kernel/Adam_1"
  input: "DAGM/conv2d/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d/bias/Adam"
  input: "DAGM/conv2d/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d/bias/Adam_1"
  input: "DAGM/conv2d/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 64
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_1/kernel/Adam"
  input: "DAGM/conv2d_1/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_1/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 64
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_1/kernel/Adam_1"
  input: "DAGM/conv2d_1/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_1/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_1/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_1/bias/Adam"
  input: "DAGM/conv2d_1/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_1/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_1/bias/Adam_1"
  input: "DAGM/conv2d_1/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_1/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_1/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 64
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_2/kernel/Adam"
  input: "DAGM/conv2d_2/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_2/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 64
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_2/kernel/Adam_1"
  input: "DAGM/conv2d_2/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_2/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_2/bias/Adam"
  input: "DAGM/conv2d_2/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_2/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_2/bias/Adam_1"
  input: "DAGM/conv2d_2/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_2/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_2/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 128
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_3/kernel/Adam"
  input: "DAGM/conv2d_3/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_3/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 128
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_3/kernel/Adam_1"
  input: "DAGM/conv2d_3/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_3/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_3/bias/Adam"
  input: "DAGM/conv2d_3/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_3/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_3/bias/Adam_1"
  input: "DAGM/conv2d_3/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_3/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_3/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 128
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_4/kernel/Adam"
  input: "DAGM/conv2d_4/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_4/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 128
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_4/kernel/Adam_1"
  input: "DAGM/conv2d_4/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_4/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_4/bias/Adam"
  input: "DAGM/conv2d_4/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_4/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_4/bias/Adam_1"
  input: "DAGM/conv2d_4/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_4/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_4/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 128
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_5/kernel/Adam"
  input: "DAGM/conv2d_5/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_5/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 128
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 128
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_5/kernel/Adam_1"
  input: "DAGM/conv2d_5/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_5/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_5/bias/Adam"
  input: "DAGM/conv2d_5/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_5/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_5/bias/Adam_1"
  input: "DAGM/conv2d_5/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_5/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_5/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 256
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_6/kernel/Adam"
  input: "DAGM/conv2d_6/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_6/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 256
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_6/kernel/Adam_1"
  input: "DAGM/conv2d_6/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_6/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_6/bias/Adam"
  input: "DAGM/conv2d_6/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_6/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_6/bias/Adam_1"
  input: "DAGM/conv2d_6/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_6/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_6/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 256
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_7/kernel/Adam"
  input: "DAGM/conv2d_7/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_7/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 256
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_7/kernel/Adam_1"
  input: "DAGM/conv2d_7/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_7/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_7/bias/Adam"
  input: "DAGM/conv2d_7/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_7/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_7/bias/Adam_1"
  input: "DAGM/conv2d_7/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_7/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_7/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 256
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_8/kernel/Adam"
  input: "DAGM/conv2d_8/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_8/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 256
          }
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 256
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_8/kernel/Adam_1"
  input: "DAGM/conv2d_8/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_8/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/conv2d_8/bias/Adam"
  input: "DAGM/conv2d_8/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam/read"
  op: "Identity"
  input: "DAGM/conv2d_8/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/conv2d_8/bias/Adam_1"
  input: "DAGM/conv2d_8/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/conv2d_8/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/conv2d_8/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4096
          }
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/dense/kernel/Adam"
  input: "DAGM/dense/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/dense/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4096
          }
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/dense/kernel/Adam_1"
  input: "DAGM/dense/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/dense/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/dense/bias/Adam"
  input: "DAGM/dense/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam/read"
  op: "Identity"
  input: "DAGM/dense/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/dense/bias/Adam_1"
  input: "DAGM/dense/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/dense/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/dense_1/kernel/Adam"
  input: "DAGM/dense_1/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/dense_1/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/dense_1/kernel/Adam_1"
  input: "DAGM/dense_1/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_1/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/dense_1/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/dense_1/bias/Adam"
  input: "DAGM/dense_1/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam/read"
  op: "Identity"
  input: "DAGM/dense_1/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/dense_1/bias/Adam_1"
  input: "DAGM/dense_1/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_1/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/dense_1/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam/Assign"
  op: "Assign"
  input: "DAGM/dense_2/kernel/Adam"
  input: "DAGM/dense_2/kernel/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam/read"
  op: "Identity"
  input: "DAGM/dense_2/kernel/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1024
          }
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1024
        }
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/dense_2/kernel/Adam_1"
  input: "DAGM/dense_2/kernel/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_2/kernel/Adam_1/read"
  op: "Identity"
  input: "DAGM/dense_2/kernel/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam/Assign"
  op: "Assign"
  input: "DAGM/dense_2/bias/Adam"
  input: "DAGM/dense_2/bias/Adam/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam/read"
  op: "Identity"
  input: "DAGM/dense_2/bias/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 12
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 12
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam_1/Assign"
  op: "Assign"
  input: "DAGM/dense_2/bias/Adam_1"
  input: "DAGM/dense_2/bias/Adam_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "DAGM/dense_2/bias/Adam_1/read"
  op: "Identity"
  input: "DAGM/dense_2/bias/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
}
node {
  name: "Adam/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-05
      }
    }
  }
}
node {
  name: "Adam/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Adam/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "Adam/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993922529e-09
      }
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d/kernel"
  input: "DAGM/conv2d/kernel/Adam"
  input: "DAGM/conv2d/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d/bias"
  input: "DAGM/conv2d/bias/Adam"
  input: "DAGM/conv2d/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_1/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_1/kernel"
  input: "DAGM/conv2d_1/kernel/Adam"
  input: "DAGM/conv2d_1/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_2/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_1/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_1/bias"
  input: "DAGM/conv2d_1/bias/Adam"
  input: "DAGM/conv2d_1/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_2/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_2/kernel"
  input: "DAGM/conv2d_2/kernel/Adam"
  input: "DAGM/conv2d_2/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_3/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_2/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_2/bias"
  input: "DAGM/conv2d_2/bias/Adam"
  input: "DAGM/conv2d_2/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_3/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_3/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_3/kernel"
  input: "DAGM/conv2d_3/kernel/Adam"
  input: "DAGM/conv2d_3/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_4/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_3/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_3/bias"
  input: "DAGM/conv2d_3/bias/Adam"
  input: "DAGM/conv2d_3/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_4/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_4/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_4/kernel"
  input: "DAGM/conv2d_4/kernel/Adam"
  input: "DAGM/conv2d_4/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_5/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_4/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_4/bias"
  input: "DAGM/conv2d_4/bias/Adam"
  input: "DAGM/conv2d_4/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_5/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_5/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_5/kernel"
  input: "DAGM/conv2d_5/kernel/Adam"
  input: "DAGM/conv2d_5/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_6/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_5/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_5/bias"
  input: "DAGM/conv2d_5/bias/Adam"
  input: "DAGM/conv2d_5/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_6/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_6/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_6/kernel"
  input: "DAGM/conv2d_6/kernel/Adam"
  input: "DAGM/conv2d_6/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_7/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_6/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_6/bias"
  input: "DAGM/conv2d_6/bias/Adam"
  input: "DAGM/conv2d_6/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_7/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_7/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_7/kernel"
  input: "DAGM/conv2d_7/kernel/Adam"
  input: "DAGM/conv2d_7/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_8/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_7/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_7/bias"
  input: "DAGM/conv2d_7/bias/Adam"
  input: "DAGM/conv2d_7/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_8/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_8/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_8/kernel"
  input: "DAGM/conv2d_8/kernel/Adam"
  input: "DAGM/conv2d_8/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_9/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/conv2d_8/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/conv2d_8/bias"
  input: "DAGM/conv2d_8/bias/Adam"
  input: "DAGM/conv2d_8/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/conv2d_9/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/dense/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/dense/kernel"
  input: "DAGM/dense/kernel/Adam"
  input: "DAGM/dense/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/dense/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/dense/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/dense/bias"
  input: "DAGM/dense/bias/Adam"
  input: "DAGM/dense/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/dense/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/dense_1/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/dense_1/kernel"
  input: "DAGM/dense_1/kernel/Adam"
  input: "DAGM/dense_1/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/dense_2/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/dense_1/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/dense_1/bias"
  input: "DAGM/dense_1/bias/Adam"
  input: "DAGM/dense_1/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/dense_2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/dense_2/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/dense_2/kernel"
  input: "DAGM/dense_2/kernel/Adam"
  input: "DAGM/dense_2/kernel/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/dense_3/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/update_DAGM/dense_2/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "DAGM/dense_2/bias"
  input: "DAGM/dense_2/bias/Adam"
  input: "DAGM/dense_2/bias/Adam_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "Adam/learning_rate"
  input: "Adam/beta1"
  input: "Adam/beta2"
  input: "Adam/epsilon"
  input: "gradients/DAGM/dense_3/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "Adam/mul"
  op: "Mul"
  input: "beta1_power/read"
  input: "Adam/beta1"
  input: "^Adam/update_DAGM/conv2d/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_1/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_1/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_2/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_2/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_3/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_3/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_4/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_4/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_5/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_5/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_6/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_6/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_7/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_7/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_8/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_8/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense_1/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense_1/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense_2/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense_2/bias/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "Adam/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "Adam/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam/mul_1"
  op: "Mul"
  input: "beta2_power/read"
  input: "Adam/beta2"
  input: "^Adam/update_DAGM/conv2d/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_1/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_1/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_2/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_2/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_3/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_3/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_4/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_4/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_5/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_5/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_6/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_6/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_7/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_7/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_8/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_8/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense_1/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense_1/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense_2/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense_2/bias/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "Adam/Assign_1"
  op: "Assign"
  input: "beta2_power"
  input: "Adam/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adam"
  op: "NoOp"
  input: "^Adam/update_DAGM/conv2d/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_1/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_1/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_2/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_2/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_3/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_3/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_4/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_4/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_5/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_5/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_6/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_6/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_7/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_7/bias/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_8/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/conv2d_8/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense_1/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense_1/bias/ApplyAdam"
  input: "^Adam/update_DAGM/dense_2/kernel/ApplyAdam"
  input: "^Adam/update_DAGM/dense_2/bias/ApplyAdam"
  input: "^Adam/Assign"
  input: "^Adam/Assign_1"
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "DAGM/dense_3/BiasAdd"
  input: "ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "ArgMax_1"
  op: "ArgMax"
  input: "DAGM/Placeholder"
  input: "ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "ArgMax"
  input: "ArgMax_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Cast_1"
  op: "Cast"
  input: "Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Mean_1"
  op: "Mean"
  input: "Cast_1"
  input: "Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 74
          }
        }
        string_val: "DAGM/conv2d/bias"
        string_val: "DAGM/conv2d/bias/Adam"
        string_val: "DAGM/conv2d/bias/Adam_1"
        string_val: "DAGM/conv2d/kernel"
        string_val: "DAGM/conv2d/kernel/Adam"
        string_val: "DAGM/conv2d/kernel/Adam_1"
        string_val: "DAGM/conv2d_1/bias"
        string_val: "DAGM/conv2d_1/bias/Adam"
        string_val: "DAGM/conv2d_1/bias/Adam_1"
        string_val: "DAGM/conv2d_1/kernel"
        string_val: "DAGM/conv2d_1/kernel/Adam"
        string_val: "DAGM/conv2d_1/kernel/Adam_1"
        string_val: "DAGM/conv2d_2/bias"
        string_val: "DAGM/conv2d_2/bias/Adam"
        string_val: "DAGM/conv2d_2/bias/Adam_1"
        string_val: "DAGM/conv2d_2/kernel"
        string_val: "DAGM/conv2d_2/kernel/Adam"
        string_val: "DAGM/conv2d_2/kernel/Adam_1"
        string_val: "DAGM/conv2d_3/bias"
        string_val: "DAGM/conv2d_3/bias/Adam"
        string_val: "DAGM/conv2d_3/bias/Adam_1"
        string_val: "DAGM/conv2d_3/kernel"
        string_val: "DAGM/conv2d_3/kernel/Adam"
        string_val: "DAGM/conv2d_3/kernel/Adam_1"
        string_val: "DAGM/conv2d_4/bias"
        string_val: "DAGM/conv2d_4/bias/Adam"
        string_val: "DAGM/conv2d_4/bias/Adam_1"
        string_val: "DAGM/conv2d_4/kernel"
        string_val: "DAGM/conv2d_4/kernel/Adam"
        string_val: "DAGM/conv2d_4/kernel/Adam_1"
        string_val: "DAGM/conv2d_5/bias"
        string_val: "DAGM/conv2d_5/bias/Adam"
        string_val: "DAGM/conv2d_5/bias/Adam_1"
        string_val: "DAGM/conv2d_5/kernel"
        string_val: "DAGM/conv2d_5/kernel/Adam"
        string_val: "DAGM/conv2d_5/kernel/Adam_1"
        string_val: "DAGM/conv2d_6/bias"
        string_val: "DAGM/conv2d_6/bias/Adam"
        string_val: "DAGM/conv2d_6/bias/Adam_1"
        string_val: "DAGM/conv2d_6/kernel"
        string_val: "DAGM/conv2d_6/kernel/Adam"
        string_val: "DAGM/conv2d_6/kernel/Adam_1"
        string_val: "DAGM/conv2d_7/bias"
        string_val: "DAGM/conv2d_7/bias/Adam"
        string_val: "DAGM/conv2d_7/bias/Adam_1"
        string_val: "DAGM/conv2d_7/kernel"
        string_val: "DAGM/conv2d_7/kernel/Adam"
        string_val: "DAGM/conv2d_7/kernel/Adam_1"
        string_val: "DAGM/conv2d_8/bias"
        string_val: "DAGM/conv2d_8/bias/Adam"
        string_val: "DAGM/conv2d_8/bias/Adam_1"
        string_val: "DAGM/conv2d_8/kernel"
        string_val: "DAGM/conv2d_8/kernel/Adam"
        string_val: "DAGM/conv2d_8/kernel/Adam_1"
        string_val: "DAGM/dense/bias"
        string_val: "DAGM/dense/bias/Adam"
        string_val: "DAGM/dense/bias/Adam_1"
        string_val: "DAGM/dense/kernel"
        string_val: "DAGM/dense/kernel/Adam"
        string_val: "DAGM/dense/kernel/Adam_1"
        string_val: "DAGM/dense_1/bias"
        string_val: "DAGM/dense_1/bias/Adam"
        string_val: "DAGM/dense_1/bias/Adam_1"
        string_val: "DAGM/dense_1/kernel"
        string_val: "DAGM/dense_1/kernel/Adam"
        string_val: "DAGM/dense_1/kernel/Adam_1"
        string_val: "DAGM/dense_2/bias"
        string_val: "DAGM/dense_2/bias/Adam"
        string_val: "DAGM/dense_2/bias/Adam_1"
        string_val: "DAGM/dense_2/kernel"
        string_val: "DAGM/dense_2/kernel/Adam"
        string_val: "DAGM/dense_2/kernel/Adam_1"
        string_val: "beta1_power"
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 74
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "DAGM/conv2d/bias"
  input: "DAGM/conv2d/bias/Adam"
  input: "DAGM/conv2d/bias/Adam_1"
  input: "DAGM/conv2d/kernel"
  input: "DAGM/conv2d/kernel/Adam"
  input: "DAGM/conv2d/kernel/Adam_1"
  input: "DAGM/conv2d_1/bias"
  input: "DAGM/conv2d_1/bias/Adam"
  input: "DAGM/conv2d_1/bias/Adam_1"
  input: "DAGM/conv2d_1/kernel"
  input: "DAGM/conv2d_1/kernel/Adam"
  input: "DAGM/conv2d_1/kernel/Adam_1"
  input: "DAGM/conv2d_2/bias"
  input: "DAGM/conv2d_2/bias/Adam"
  input: "DAGM/conv2d_2/bias/Adam_1"
  input: "DAGM/conv2d_2/kernel"
  input: "DAGM/conv2d_2/kernel/Adam"
  input: "DAGM/conv2d_2/kernel/Adam_1"
  input: "DAGM/conv2d_3/bias"
  input: "DAGM/conv2d_3/bias/Adam"
  input: "DAGM/conv2d_3/bias/Adam_1"
  input: "DAGM/conv2d_3/kernel"
  input: "DAGM/conv2d_3/kernel/Adam"
  input: "DAGM/conv2d_3/kernel/Adam_1"
  input: "DAGM/conv2d_4/bias"
  input: "DAGM/conv2d_4/bias/Adam"
  input: "DAGM/conv2d_4/bias/Adam_1"
  input: "DAGM/conv2d_4/kernel"
  input: "DAGM/conv2d_4/kernel/Adam"
  input: "DAGM/conv2d_4/kernel/Adam_1"
  input: "DAGM/conv2d_5/bias"
  input: "DAGM/conv2d_5/bias/Adam"
  input: "DAGM/conv2d_5/bias/Adam_1"
  input: "DAGM/conv2d_5/kernel"
  input: "DAGM/conv2d_5/kernel/Adam"
  input: "DAGM/conv2d_5/kernel/Adam_1"
  input: "DAGM/conv2d_6/bias"
  input: "DAGM/conv2d_6/bias/Adam"
  input: "DAGM/conv2d_6/bias/Adam_1"
  input: "DAGM/conv2d_6/kernel"
  input: "DAGM/conv2d_6/kernel/Adam"
  input: "DAGM/conv2d_6/kernel/Adam_1"
  input: "DAGM/conv2d_7/bias"
  input: "DAGM/conv2d_7/bias/Adam"
  input: "DAGM/conv2d_7/bias/Adam_1"
  input: "DAGM/conv2d_7/kernel"
  input: "DAGM/conv2d_7/kernel/Adam"
  input: "DAGM/conv2d_7/kernel/Adam_1"
  input: "DAGM/conv2d_8/bias"
  input: "DAGM/conv2d_8/bias/Adam"
  input: "DAGM/conv2d_8/bias/Adam_1"
  input: "DAGM/conv2d_8/kernel"
  input: "DAGM/conv2d_8/kernel/Adam"
  input: "DAGM/conv2d_8/kernel/Adam_1"
  input: "DAGM/dense/bias"
  input: "DAGM/dense/bias/Adam"
  input: "DAGM/dense/bias/Adam_1"
  input: "DAGM/dense/kernel"
  input: "DAGM/dense/kernel/Adam"
  input: "DAGM/dense/kernel/Adam_1"
  input: "DAGM/dense_1/bias"
  input: "DAGM/dense_1/bias/Adam"
  input: "DAGM/dense_1/bias/Adam_1"
  input: "DAGM/dense_1/kernel"
  input: "DAGM/dense_1/kernel/Adam"
  input: "DAGM/dense_1/kernel/Adam_1"
  input: "DAGM/dense_2/bias"
  input: "DAGM/dense_2/bias/Adam"
  input: "DAGM/dense_2/bias/Adam_1"
  input: "DAGM/dense_2/kernel"
  input: "DAGM/dense_2/kernel/Adam"
  input: "DAGM/dense_2/kernel/Adam_1"
  input: "beta1_power"
  input: "beta2_power"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "DAGM/conv2d/bias"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_1/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_1/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_1"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_1/tensor_names"
  input: "save/RestoreV2_1/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "DAGM/conv2d/bias/Adam"
  input: "save/RestoreV2_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_2/tensor_names"
  input: "save/RestoreV2_2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "DAGM/conv2d/bias/Adam_1"
  input: "save/RestoreV2_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_3/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_3/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_3"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_3/tensor_names"
  input: "save/RestoreV2_3/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "DAGM/conv2d/kernel"
  input: "save/RestoreV2_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_4/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_4/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_4"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_4/tensor_names"
  input: "save/RestoreV2_4/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "DAGM/conv2d/kernel/Adam"
  input: "save/RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_5/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_5/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_5"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_5/tensor_names"
  input: "save/RestoreV2_5/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "DAGM/conv2d/kernel/Adam_1"
  input: "save/RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_6/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_1/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_6/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_6"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_6/tensor_names"
  input: "save/RestoreV2_6/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "DAGM/conv2d_1/bias"
  input: "save/RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_7/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_1/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_7/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_7"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_7/tensor_names"
  input: "save/RestoreV2_7/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "DAGM/conv2d_1/bias/Adam"
  input: "save/RestoreV2_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_8/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_1/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_8/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_8"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_8/tensor_names"
  input: "save/RestoreV2_8/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "DAGM/conv2d_1/bias/Adam_1"
  input: "save/RestoreV2_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_9/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_9/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_9"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_9/tensor_names"
  input: "save/RestoreV2_9/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "DAGM/conv2d_1/kernel"
  input: "save/RestoreV2_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_10/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_1/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_10/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_10"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_10/tensor_names"
  input: "save/RestoreV2_10/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "DAGM/conv2d_1/kernel/Adam"
  input: "save/RestoreV2_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_11/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_1/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_11/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_11"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_11/tensor_names"
  input: "save/RestoreV2_11/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "DAGM/conv2d_1/kernel/Adam_1"
  input: "save/RestoreV2_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_12/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_2/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_12/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_12"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_12/tensor_names"
  input: "save/RestoreV2_12/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "DAGM/conv2d_2/bias"
  input: "save/RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_13/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_2/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_13/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_13"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_13/tensor_names"
  input: "save/RestoreV2_13/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "DAGM/conv2d_2/bias/Adam"
  input: "save/RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_14/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_2/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_14/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_14"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_14/tensor_names"
  input: "save/RestoreV2_14/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "DAGM/conv2d_2/bias/Adam_1"
  input: "save/RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_15/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_15/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_15"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_15/tensor_names"
  input: "save/RestoreV2_15/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "DAGM/conv2d_2/kernel"
  input: "save/RestoreV2_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_16/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_2/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_16/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_16"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_16/tensor_names"
  input: "save/RestoreV2_16/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "DAGM/conv2d_2/kernel/Adam"
  input: "save/RestoreV2_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_17/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_2/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_17/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_17"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_17/tensor_names"
  input: "save/RestoreV2_17/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "DAGM/conv2d_2/kernel/Adam_1"
  input: "save/RestoreV2_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_18/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_3/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_18/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_18"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_18/tensor_names"
  input: "save/RestoreV2_18/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "DAGM/conv2d_3/bias"
  input: "save/RestoreV2_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_19/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_3/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_19/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_19"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_19/tensor_names"
  input: "save/RestoreV2_19/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "DAGM/conv2d_3/bias/Adam"
  input: "save/RestoreV2_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_20/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_3/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_20/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_20"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_20/tensor_names"
  input: "save/RestoreV2_20/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "DAGM/conv2d_3/bias/Adam_1"
  input: "save/RestoreV2_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_21/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_21/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_21"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_21/tensor_names"
  input: "save/RestoreV2_21/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "DAGM/conv2d_3/kernel"
  input: "save/RestoreV2_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_22/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_3/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_22/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_22"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_22/tensor_names"
  input: "save/RestoreV2_22/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "DAGM/conv2d_3/kernel/Adam"
  input: "save/RestoreV2_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_23/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_3/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_23/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_23"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_23/tensor_names"
  input: "save/RestoreV2_23/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "DAGM/conv2d_3/kernel/Adam_1"
  input: "save/RestoreV2_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_24/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_4/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_24/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_24"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_24/tensor_names"
  input: "save/RestoreV2_24/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "DAGM/conv2d_4/bias"
  input: "save/RestoreV2_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_25/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_4/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_25/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_25"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_25/tensor_names"
  input: "save/RestoreV2_25/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "DAGM/conv2d_4/bias/Adam"
  input: "save/RestoreV2_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_26/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_4/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_26/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_26"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_26/tensor_names"
  input: "save/RestoreV2_26/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "DAGM/conv2d_4/bias/Adam_1"
  input: "save/RestoreV2_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_27/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_4/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_27/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_27"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_27/tensor_names"
  input: "save/RestoreV2_27/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "DAGM/conv2d_4/kernel"
  input: "save/RestoreV2_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_28/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_4/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_28/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_28"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_28/tensor_names"
  input: "save/RestoreV2_28/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "DAGM/conv2d_4/kernel/Adam"
  input: "save/RestoreV2_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_29/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_4/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_29/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_29"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_29/tensor_names"
  input: "save/RestoreV2_29/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "DAGM/conv2d_4/kernel/Adam_1"
  input: "save/RestoreV2_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_30/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_5/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_30/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_30"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_30/tensor_names"
  input: "save/RestoreV2_30/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "DAGM/conv2d_5/bias"
  input: "save/RestoreV2_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_31/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_5/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_31/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_31"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_31/tensor_names"
  input: "save/RestoreV2_31/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "DAGM/conv2d_5/bias/Adam"
  input: "save/RestoreV2_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_32/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_5/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_32/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_32"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_32/tensor_names"
  input: "save/RestoreV2_32/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "DAGM/conv2d_5/bias/Adam_1"
  input: "save/RestoreV2_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_33/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_5/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_33/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_33"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_33/tensor_names"
  input: "save/RestoreV2_33/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "DAGM/conv2d_5/kernel"
  input: "save/RestoreV2_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_34/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_5/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_34/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_34"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_34/tensor_names"
  input: "save/RestoreV2_34/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "DAGM/conv2d_5/kernel/Adam"
  input: "save/RestoreV2_34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_35/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_5/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_35/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_35"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_35/tensor_names"
  input: "save/RestoreV2_35/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "DAGM/conv2d_5/kernel/Adam_1"
  input: "save/RestoreV2_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_36/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_6/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_36/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_36"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_36/tensor_names"
  input: "save/RestoreV2_36/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "DAGM/conv2d_6/bias"
  input: "save/RestoreV2_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_37/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_6/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_37/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_37"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_37/tensor_names"
  input: "save/RestoreV2_37/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "DAGM/conv2d_6/bias/Adam"
  input: "save/RestoreV2_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_38/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_6/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_38/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_38"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_38/tensor_names"
  input: "save/RestoreV2_38/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_38"
  op: "Assign"
  input: "DAGM/conv2d_6/bias/Adam_1"
  input: "save/RestoreV2_38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_39/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_6/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_39/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_39"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_39/tensor_names"
  input: "save/RestoreV2_39/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_39"
  op: "Assign"
  input: "DAGM/conv2d_6/kernel"
  input: "save/RestoreV2_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_40/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_6/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_40/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_40"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_40/tensor_names"
  input: "save/RestoreV2_40/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_40"
  op: "Assign"
  input: "DAGM/conv2d_6/kernel/Adam"
  input: "save/RestoreV2_40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_41/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_6/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_41/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_41"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_41/tensor_names"
  input: "save/RestoreV2_41/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_41"
  op: "Assign"
  input: "DAGM/conv2d_6/kernel/Adam_1"
  input: "save/RestoreV2_41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_42/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_7/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_42/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_42"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_42/tensor_names"
  input: "save/RestoreV2_42/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_42"
  op: "Assign"
  input: "DAGM/conv2d_7/bias"
  input: "save/RestoreV2_42"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_43/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_7/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_43/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_43"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_43/tensor_names"
  input: "save/RestoreV2_43/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_43"
  op: "Assign"
  input: "DAGM/conv2d_7/bias/Adam"
  input: "save/RestoreV2_43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_44/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_7/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_44/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_44"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_44/tensor_names"
  input: "save/RestoreV2_44/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_44"
  op: "Assign"
  input: "DAGM/conv2d_7/bias/Adam_1"
  input: "save/RestoreV2_44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_45/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_7/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_45/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_45"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_45/tensor_names"
  input: "save/RestoreV2_45/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_45"
  op: "Assign"
  input: "DAGM/conv2d_7/kernel"
  input: "save/RestoreV2_45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_46/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_7/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_46/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_46"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_46/tensor_names"
  input: "save/RestoreV2_46/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_46"
  op: "Assign"
  input: "DAGM/conv2d_7/kernel/Adam"
  input: "save/RestoreV2_46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_47/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_7/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_47/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_47"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_47/tensor_names"
  input: "save/RestoreV2_47/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_47"
  op: "Assign"
  input: "DAGM/conv2d_7/kernel/Adam_1"
  input: "save/RestoreV2_47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_48/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_8/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_48/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_48"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_48/tensor_names"
  input: "save/RestoreV2_48/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_48"
  op: "Assign"
  input: "DAGM/conv2d_8/bias"
  input: "save/RestoreV2_48"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_49/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_8/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_49/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_49"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_49/tensor_names"
  input: "save/RestoreV2_49/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_49"
  op: "Assign"
  input: "DAGM/conv2d_8/bias/Adam"
  input: "save/RestoreV2_49"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_50/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_8/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_50/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_50"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_50/tensor_names"
  input: "save/RestoreV2_50/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_50"
  op: "Assign"
  input: "DAGM/conv2d_8/bias/Adam_1"
  input: "save/RestoreV2_50"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_51/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_8/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_51/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_51"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_51/tensor_names"
  input: "save/RestoreV2_51/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_51"
  op: "Assign"
  input: "DAGM/conv2d_8/kernel"
  input: "save/RestoreV2_51"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_52/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_8/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_52/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_52"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_52/tensor_names"
  input: "save/RestoreV2_52/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_52"
  op: "Assign"
  input: "DAGM/conv2d_8/kernel/Adam"
  input: "save/RestoreV2_52"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_53/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/conv2d_8/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_53/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_53"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_53/tensor_names"
  input: "save/RestoreV2_53/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_53"
  op: "Assign"
  input: "DAGM/conv2d_8/kernel/Adam_1"
  input: "save/RestoreV2_53"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d_8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_54/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_54/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_54"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_54/tensor_names"
  input: "save/RestoreV2_54/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_54"
  op: "Assign"
  input: "DAGM/dense/bias"
  input: "save/RestoreV2_54"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_55/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_55/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_55"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_55/tensor_names"
  input: "save/RestoreV2_55/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_55"
  op: "Assign"
  input: "DAGM/dense/bias/Adam"
  input: "save/RestoreV2_55"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_56/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_56/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_56"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_56/tensor_names"
  input: "save/RestoreV2_56/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_56"
  op: "Assign"
  input: "DAGM/dense/bias/Adam_1"
  input: "save/RestoreV2_56"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_57/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_57/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_57"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_57/tensor_names"
  input: "save/RestoreV2_57/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_57"
  op: "Assign"
  input: "DAGM/dense/kernel"
  input: "save/RestoreV2_57"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_58/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_58/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_58"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_58/tensor_names"
  input: "save/RestoreV2_58/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_58"
  op: "Assign"
  input: "DAGM/dense/kernel/Adam"
  input: "save/RestoreV2_58"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_59/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_59/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_59"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_59/tensor_names"
  input: "save/RestoreV2_59/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_59"
  op: "Assign"
  input: "DAGM/dense/kernel/Adam_1"
  input: "save/RestoreV2_59"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_60/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_1/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_60/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_60"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_60/tensor_names"
  input: "save/RestoreV2_60/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_60"
  op: "Assign"
  input: "DAGM/dense_1/bias"
  input: "save/RestoreV2_60"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_61/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_1/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_61/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_61"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_61/tensor_names"
  input: "save/RestoreV2_61/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_61"
  op: "Assign"
  input: "DAGM/dense_1/bias/Adam"
  input: "save/RestoreV2_61"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_62/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_1/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_62/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_62"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_62/tensor_names"
  input: "save/RestoreV2_62/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_62"
  op: "Assign"
  input: "DAGM/dense_1/bias/Adam_1"
  input: "save/RestoreV2_62"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_63/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_1/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_63/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_63"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_63/tensor_names"
  input: "save/RestoreV2_63/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_63"
  op: "Assign"
  input: "DAGM/dense_1/kernel"
  input: "save/RestoreV2_63"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_64/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_1/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_64/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_64"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_64/tensor_names"
  input: "save/RestoreV2_64/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_64"
  op: "Assign"
  input: "DAGM/dense_1/kernel/Adam"
  input: "save/RestoreV2_64"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_65/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_1/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_65/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_65"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_65/tensor_names"
  input: "save/RestoreV2_65/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_65"
  op: "Assign"
  input: "DAGM/dense_1/kernel/Adam_1"
  input: "save/RestoreV2_65"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_66/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_2/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_66/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_66"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_66/tensor_names"
  input: "save/RestoreV2_66/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_66"
  op: "Assign"
  input: "DAGM/dense_2/bias"
  input: "save/RestoreV2_66"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_67/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_2/bias/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_67/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_67"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_67/tensor_names"
  input: "save/RestoreV2_67/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_67"
  op: "Assign"
  input: "DAGM/dense_2/bias/Adam"
  input: "save/RestoreV2_67"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_68/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_2/bias/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_68/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_68"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_68/tensor_names"
  input: "save/RestoreV2_68/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_68"
  op: "Assign"
  input: "DAGM/dense_2/bias/Adam_1"
  input: "save/RestoreV2_68"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_69/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_2/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_69/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_69"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_69/tensor_names"
  input: "save/RestoreV2_69/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_69"
  op: "Assign"
  input: "DAGM/dense_2/kernel"
  input: "save/RestoreV2_69"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_70/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_2/kernel/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_70/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_70"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_70/tensor_names"
  input: "save/RestoreV2_70/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_70"
  op: "Assign"
  input: "DAGM/dense_2/kernel/Adam"
  input: "save/RestoreV2_70"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_71/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "DAGM/dense_2/kernel/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_71/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_71"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_71/tensor_names"
  input: "save/RestoreV2_71/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_71"
  op: "Assign"
  input: "DAGM/dense_2/kernel/Adam_1"
  input: "save/RestoreV2_71"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_72/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "beta1_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_72/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_72"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_72/tensor_names"
  input: "save/RestoreV2_72/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_72"
  op: "Assign"
  input: "beta1_power"
  input: "save/RestoreV2_72"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_73/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_73/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_73"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_73/tensor_names"
  input: "save/RestoreV2_73/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_73"
  op: "Assign"
  input: "beta2_power"
  input: "save/RestoreV2_73"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@DAGM/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_38"
  input: "^save/Assign_39"
  input: "^save/Assign_40"
  input: "^save/Assign_41"
  input: "^save/Assign_42"
  input: "^save/Assign_43"
  input: "^save/Assign_44"
  input: "^save/Assign_45"
  input: "^save/Assign_46"
  input: "^save/Assign_47"
  input: "^save/Assign_48"
  input: "^save/Assign_49"
  input: "^save/Assign_50"
  input: "^save/Assign_51"
  input: "^save/Assign_52"
  input: "^save/Assign_53"
  input: "^save/Assign_54"
  input: "^save/Assign_55"
  input: "^save/Assign_56"
  input: "^save/Assign_57"
  input: "^save/Assign_58"
  input: "^save/Assign_59"
  input: "^save/Assign_60"
  input: "^save/Assign_61"
  input: "^save/Assign_62"
  input: "^save/Assign_63"
  input: "^save/Assign_64"
  input: "^save/Assign_65"
  input: "^save/Assign_66"
  input: "^save/Assign_67"
  input: "^save/Assign_68"
  input: "^save/Assign_69"
  input: "^save/Assign_70"
  input: "^save/Assign_71"
  input: "^save/Assign_72"
  input: "^save/Assign_73"
}
node {
  name: "init"
  op: "NoOp"
  input: "^DAGM/conv2d/kernel/Assign"
  input: "^DAGM/conv2d/bias/Assign"
  input: "^DAGM/conv2d_1/kernel/Assign"
  input: "^DAGM/conv2d_1/bias/Assign"
  input: "^DAGM/conv2d_2/kernel/Assign"
  input: "^DAGM/conv2d_2/bias/Assign"
  input: "^DAGM/conv2d_3/kernel/Assign"
  input: "^DAGM/conv2d_3/bias/Assign"
  input: "^DAGM/conv2d_4/kernel/Assign"
  input: "^DAGM/conv2d_4/bias/Assign"
  input: "^DAGM/conv2d_5/kernel/Assign"
  input: "^DAGM/conv2d_5/bias/Assign"
  input: "^DAGM/conv2d_6/kernel/Assign"
  input: "^DAGM/conv2d_6/bias/Assign"
  input: "^DAGM/conv2d_7/kernel/Assign"
  input: "^DAGM/conv2d_7/bias/Assign"
  input: "^DAGM/conv2d_8/kernel/Assign"
  input: "^DAGM/conv2d_8/bias/Assign"
  input: "^DAGM/dense/kernel/Assign"
  input: "^DAGM/dense/bias/Assign"
  input: "^DAGM/dense_1/kernel/Assign"
  input: "^DAGM/dense_1/bias/Assign"
  input: "^DAGM/dense_2/kernel/Assign"
  input: "^DAGM/dense_2/bias/Assign"
  input: "^beta1_power/Assign"
  input: "^beta2_power/Assign"
  input: "^DAGM/conv2d/kernel/Adam/Assign"
  input: "^DAGM/conv2d/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d/bias/Adam/Assign"
  input: "^DAGM/conv2d/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_1/kernel/Adam/Assign"
  input: "^DAGM/conv2d_1/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_1/bias/Adam/Assign"
  input: "^DAGM/conv2d_1/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_2/kernel/Adam/Assign"
  input: "^DAGM/conv2d_2/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_2/bias/Adam/Assign"
  input: "^DAGM/conv2d_2/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_3/kernel/Adam/Assign"
  input: "^DAGM/conv2d_3/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_3/bias/Adam/Assign"
  input: "^DAGM/conv2d_3/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_4/kernel/Adam/Assign"
  input: "^DAGM/conv2d_4/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_4/bias/Adam/Assign"
  input: "^DAGM/conv2d_4/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_5/kernel/Adam/Assign"
  input: "^DAGM/conv2d_5/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_5/bias/Adam/Assign"
  input: "^DAGM/conv2d_5/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_6/kernel/Adam/Assign"
  input: "^DAGM/conv2d_6/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_6/bias/Adam/Assign"
  input: "^DAGM/conv2d_6/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_7/kernel/Adam/Assign"
  input: "^DAGM/conv2d_7/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_7/bias/Adam/Assign"
  input: "^DAGM/conv2d_7/bias/Adam_1/Assign"
  input: "^DAGM/conv2d_8/kernel/Adam/Assign"
  input: "^DAGM/conv2d_8/kernel/Adam_1/Assign"
  input: "^DAGM/conv2d_8/bias/Adam/Assign"
  input: "^DAGM/conv2d_8/bias/Adam_1/Assign"
  input: "^DAGM/dense/kernel/Adam/Assign"
  input: "^DAGM/dense/kernel/Adam_1/Assign"
  input: "^DAGM/dense/bias/Adam/Assign"
  input: "^DAGM/dense/bias/Adam_1/Assign"
  input: "^DAGM/dense_1/kernel/Adam/Assign"
  input: "^DAGM/dense_1/kernel/Adam_1/Assign"
  input: "^DAGM/dense_1/bias/Adam/Assign"
  input: "^DAGM/dense_1/bias/Adam_1/Assign"
  input: "^DAGM/dense_2/kernel/Adam/Assign"
  input: "^DAGM/dense_2/kernel/Adam_1/Assign"
  input: "^DAGM/dense_2/bias/Adam/Assign"
  input: "^DAGM/dense_2/bias/Adam_1/Assign"
}
versions {
  producer: 24
}
