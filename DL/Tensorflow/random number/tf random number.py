import tensorflow as tf
# 2.4.1
tf.__version__



import platform
platform.platform()
# Windows-10-10.0.19041-SP0


# random 
rand = tf.random.uniform([1], 0, 1) # 안에 수 만큼 출력
print(rand)
# tf.Tensor([0.03340936], shape=(1,), dtype=float32)



rand = tf.random.uniform([4], 0, 1) # 안에 수 만큼 출력
print(rand)
# tf.Tensor([0.35503888 0.39761794 0.54357445 0.44168258], shape=(4,), dtype=float32)



rand = tf.random.normal([4], 0, 1) 
print(rand)
# tf.Tensor([-0.34312898 -1.0167329   0.5735372  -1.1512161 ], shape=(4,), dtype=float32)

