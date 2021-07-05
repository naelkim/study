import numpy as np

def Loss_vec(x, y, w):
    delta = 1.0 # margin
    score = np.dot(w, x)
    loss = np.maximum (0, score - score[y] + delta) # score = 오답 / score[y] = 정답인 경우의 loss
    loss[y] = 0
    loss_i = np.sum(loss)
    return loss_i



