import random
import numpy as np
from prettytable import PrettyTable


def getPi():
    arr = []
    table = PrettyTable(["calculate time", "mean", "variance"])
    time = [20, 50, 100, 200, 300, 500, 1000, 5000]
    for t in time:
        # print(t)
        for j in range(20):
            cnt = 0
            for i in range(t):
                x = random.uniform(0, 1)  # 从一个均匀分布中随机采样，区间为左闭右开
                y = random.uniform(0, 1)

                if (x * x + y * y) < 1:
                    cnt += 1
                    # 点分布在圆内的数量,因为正方形的面积为1，所以这个同时也是圆内的点与正方形内点的比值
            vpi = 4.0 * (cnt / t)  # 4 * pi/4 = pi
            arr.append(vpi)
        mean = np.mean(arr)
        variance = np.var(arr)
        table.add_row([t, mean, variance])
    print(table)


getPi()





