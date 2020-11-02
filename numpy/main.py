import np as np
import numpy as np

if __name__ == '__main__':
    margin = '-' * 100

    # ones and zeros
    print(np.ones((3, 5), dtype=np.float32))
    print(np.zeros((6, 2), dtype=np.int8))

    print(margin)

    # arrange
    print(np.arange(10, 20))
    print(np.arange(20, 10, -1))

    print(margin)

    # Concatenate
    A = np.ones((4, 2))
    B = np.zeros((4, 3))
    print(np.concatenate([A, B], axis=1))

    print(margin)

    # astype
    C = np.array([[1.1, 2.2, 3.3],
                  [4.4, 5.5, 6.6]], dtype=np.float32)
    print(C.astype(np.uint16))

    print(margin)

    # zeros_like & ones_like
    D = np.ones((2, 2, 3))
    E = np.zeros_like(D)
    print(E.shape)

    print(margin)

    # Shaping
    F = np.array([1, 2, 3, 4, 5, 6])
    print(F.reshape(-1, 3))

    print(margin)

    # Transposition
    G = np.arange(10).reshape(5, 2)
    print(G.transpose((1, 0)))
    print(G)
    print(G[:3, :1])

    print(margin)

    # Axes
    H = np.arange(6).reshape(3, 2)
    print(H.sum(axis=0, keepdims=True))
    print(H.sum(axis=1, keepdims=True))

