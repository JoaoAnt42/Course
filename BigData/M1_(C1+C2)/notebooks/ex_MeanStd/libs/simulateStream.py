## DO NOT CHANGE

import random, copy
import matplotlib.pyplot as plt


class SimulateStream:
    stream = []
    memory1 = {}
    cache = []

    def __init__(self, N=20, outliers=0.0, outliersBarrier=0.4, min=-100, max=100, classicalAlg=None,streamAlg_init=None, streamAlg_run=None):
        print(); print(f'-- Generating the stream')
        self.stream = [0]
        self.cache = []
        for i in range(N-1):
            zz = 1.0
            if (random.random()<outliers):
                zz = 5.5
            self.stream.append(round(zz*(min + (max-min)*random.random()),3))
        print(f':generating randomly with {N} elements between {min} and {max}')

        print(); print(f'-- classicalAlg')
        self.memory1 = classicalAlg(self.stream)
        print(f':memory = {self.memory1}')

        print(); print(f'-- streamAlg')
        self.memory2 = {}
        self.memory2 = streamAlg_init(self.memory2)
        for x in self.stream:
            self.memory2 = streamAlg_run(self.memory2, x)
            self.cache.append(copy.deepcopy(self.memory2))
        print(f':memory = {self.memory2}')

        print(f':statistics')
        sz1 = len(self.stream)+len(self.memory1.keys())
        sz2 = len(self.memory2.keys())
        print(f'  - classical memory usage = {sz1}')
        print(f'  - stream memory usage = {sz2}')
        print(f'  - stream uses only {100*sz2/sz1:.3f}% of the memory')

    def compare(self, L1, L2):
        print(); print(f'-- Compare {L1} with {L2}')
        xx = []
        zz1 = [[] for _ in range(len(L1))]
        zz2 = [[] for _ in range(len(L2))]
        i = 0
        print(f':cache_instances {len(self.cache)}')
        print(f':first 3 values of the stream {self.stream[:3]}')
        for mm in self.cache:
            i += 1
            xx.append(i)
            for j in range(len(L1)):
                kk = L1[j]
                zz1[j].append(self.memory1[kk])
            for j in range(len(L2)):
                kk = L2[j]
                zz2[j].append(mm[kk])
        plt.figure(figsize=(8, 6), dpi=80)
        for i in range(len(L1)):
            plt.plot(xx,zz1[i],label=L1[i])
        for i in range(len(L2)):
            plt.plot(xx,zz2[i],label=L2[i])
        plt.scatter(xx,self.stream,label='stream points')
        plt.title(L1)
        plt.legend()
