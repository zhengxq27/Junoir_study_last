import random
import numpy as np
from prettytable import PrettyTable


def calculate_integral():
    arr = []
    table = PrettyTable(["Sampling points num", "mean", "variance"])
    time = [5, 10, 20, 30, 40, 50, 60, 70, 80, 100]
    for t in time:
        for j in range(100):  # 重复蒙特卡洛方法100次
            sum_y = 0
            for i in range(t):
                x = random.uniform(0, 1)  # x服从均匀分布，在0-1之间随机取值
                y = x*x*x
                sum_y += y
            Y = sum_y / t  # 求出单次的积分值
            arr.append(Y)
        mean = np.mean(arr)  # 重复100次求均值
        variance = np.var(arr) # 重复100次求方差
        table.add_row([t, mean, variance])
    print(table)


calculate_integral()
