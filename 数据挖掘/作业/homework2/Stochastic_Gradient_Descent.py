import numpy as np
import matplotlib.pyplot as plt
from prettytable import PrettyTable
import random


def list_to_matrix(filename):  # 这个函数将txt文件中的数据读取出来，存进一个matrix中
    np.set_printoptions(suppress=True)  # 使输出不为科学计数法形式
    fr = open(filename)
    arrayOLines = fr.readlines()
    numberOFLines = len(arrayOLines)  # 获取此list的行数
    returnMat = np.zeros((numberOFLines, 3))  # 返回的矩阵是numberOFLines * 3 的
    index = 0
    for line in arrayOLines:
        line = line.strip()  # 移除每一行结尾的最后符号，即'\n'符；
        listFromLine = line.split(' ')  # 移除每一行中出现的' '符；
        returnMat[index, :] = listFromLine[0:3]
        index += 1
    return returnMat


def gradient_descent():
    alpha = 0.00015  # 设定学习率
    theta0 = 0.0  # 初始化参数1为0.0
    theta1 = 0.0  # 初始化参数2为0.0
    theta2 = 0.0  # 初始化参数3位0.0
    Mat = list_to_matrix('dataForTraining.txt')  # 读取txt训练集，存放在matrix中
    testing_mat = list_to_matrix('dataForTesting.txt')  # 读取txt测试集，存放在matrix中

    result_table = PrettyTable(["number of iterations", "theta0",
                                "theta1", "theta2", "training_error", "testing_error"])
    training_error_arr = []
    iter_times_arr = []
    testing_error_arr = []
    m = len(Mat)
    n = len(testing_mat)
    count = 1
    for j in range(1500000):  # 迭代1500000次
        index = random.randint(0, m-1)  # 随机选取一个样本进行梯度下降
        hx = theta0 + theta1 * Mat[index][0] + theta2 * Mat[index][1]
        theta0 = theta0 - alpha * (hx - Mat[index][2]) * 1  # 标记1的符号是反的所以这里的减要变成加
        theta1 = theta1 - alpha * (hx - Mat[index][2]) * Mat[index][0]
        theta2 = theta2 - alpha * (hx - Mat[index][2]) * Mat[index][1]

        if j % 99999 == 0 and j >= 99999:  # 当迭代次数为100000的整数倍时，计算训练误差和测试误差
            iter_times_arr.append(j + count)
            temp = 0
            testing_temp = 0
            for i in range(m):
                Hx = theta0 + theta1 * Mat[i][0] + theta2 * Mat[i][1]
                temp += np.square(Hx - Mat[i][2])
            training_error = 0.5 * (1 / m) * temp
            training_error_arr.append(training_error)

            for t in range(n):
                Hx = theta0 + theta1 * testing_mat[t][0] + theta2 * testing_mat[t][1]
                testing_temp += np.square(Hx - testing_mat[t][2])
            testing_error = 0.5 * (1 / m) * testing_temp
            testing_error_arr.append(testing_error)

            result_table.add_row([j + count, theta0, theta1, theta2, training_error, testing_error])
            count += 1

    print(result_table)
    plt.figure()
    plt.plot(iter_times_arr, training_error_arr, 'x-', c='b', linewidth=1, label="training error")
    plt.plot(iter_times_arr, testing_error_arr, '+-', c='r', linewidth=1, label="testing error")
    plt.xlabel("iteration times")  # X轴标签
    plt.ylabel("error")  # Y轴标签
    plt.legend()  # 显示图例
    plt.title("Stochastic Gradient Descent")
    plt.show()


gradient_descent()





