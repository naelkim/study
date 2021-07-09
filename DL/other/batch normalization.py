import numpy as np

def batchnorm_forward(x, gamma, beta, eps):
    N, D = x.shape
    # step1 : calculate mean
    mu = ( 1. / N ) * np.sum(x, axis = 0)
    # step2 : subtract mean vector of every training example
    xmu = x - mu
    # step3 : following the lower branch - calculation denominator 
    sq = xmu ** 2
    # step4 : calculate variance
    var = ( 1. / N ) * np.sum(sq, axis = 0)
    # step5 : add eps for numerical stability, then sqrt
    sqrtvar = np.sqrt(var + eps)
    # step6 : invert sqrtwar
    ivar = 1. / sqrtvar 
    # step7 : execute normalization
    xhat = xmu * ivar 
    # step8 : Nor the two transformation steps
    gammax = gamma * xhat
    # step9 
    out = gammax + beta
    cache = (xhat, gamma, xmu, ivar, sqrtvar, var, eps)
    return out, cache




def batchnorm_backward(dout, cache): # local gradient 
    # unfold the variable stored in cache
    xhat, gamma, xmu, ivar, sqrtvar, var, eps = cache
    # get the dimentions of the input / output
    N, D = dout.shape 
    # step 9 
    dbeta = np.sum(dout, axis = 0)
    dgammax = dout
    # step 8
    dgamma = np.sum(dgammax * xhat, axis = 0 )
    dxhat = dgammax * gamma 
    # step 7
    divar = np.sum(dxhat * xhat, axis = 0 )
    dxmu1 = dxhat * ivar
    # step 6
    dsqrtvar = -1. / (sqrtvar ** 2) * divar
    # step 5
    dvar = 0.5 * 1. / np.sqrt(var + eps) * dsqrtvar 
    # step 4
    dsq = 1. / N * np.ones( (N, D) ) * dvar
    # step 3
    dxmu2 = 2 * xmu * dsq 
    # step 2 
    dx1 = (dxmu1 + dxmu2) 
    dmu = -1 * np.sum(dxmu1 + dxmu2, axis = 0 )
    # step 1
    dx2 = 1. / N * np.one( (N, D) ) * dmu
    # step 0 
    dx = dx1 + dx2 
    return dx, dgamma, dbeta 






####################################################################
# use tensorflow 
import tensorflow as tf

def batchnorm_layer(Ylogits, is_test, Offset, Scale, iteration, convolutioal = False):
    exp_moving_avg = tf.train.ExponentialMovingAverage(0.9999, iteration)
    if convolutioal:
        mean, variance = tf.nn.moments(Ylogits, [0, 1, 2])
    else:
        mean, variance = tf.nn.monents(Ylogits, [0])

    update_moving_averages = exp_moving_avg.apply([mean, variance])
    m = tf.cond(is_test, lambda: exp_moving_avg.average(mean), lambda: mean)
    v = tf.cond(is_test, lambda: exp_moving_avg.average(variance), lambda: variance )
    Ybn = tf.nn.batch_normalization(Ylogits, m, v, Offset, Scale, variance_epsilon = 1e-5)
    return Ybn, update_moving_averages