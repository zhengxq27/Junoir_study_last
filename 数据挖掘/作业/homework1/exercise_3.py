import random
import numpy as np
import math
from prettytable import PrettyTable


def calculate_complicated_integral():
    arr = []
    table = PrettyTable(["Sampling points num", "mean", "variance"])
    time = [5, 10, 20, 30, 40, 50, 60, 70, 80, 100, 200]
    for t in time:
        for j in range(1):  # 重复蒙特卡洛方法100次
            sum = 0
            for i in range(t):
                x = random.uniform(2, 4)  # 在2-4之间随机取值
                y = random.uniform(-1, 1)  # 在-1到1之间随机取值
                f_xy = ((y*y) * math.exp(-y*y) + (x*x*x*x) * math.exp(-x*x)) / (x * math.exp(-x*x))
                # 直接套公式
                sum += f_xy
            Y = 1/4 * (sum / t)  # 以随机数函数的期望作为近似的积分值
            arr.append(Y)
        mean = np.mean(arr)  # 重复100次求均值
        variance = np.var(arr)  # 重复100次求方差
        table.add_row([t, mean, variance])
    print(table)


calculate_complicated_integral()

