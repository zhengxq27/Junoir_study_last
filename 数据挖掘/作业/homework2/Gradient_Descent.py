import numpy as np
import matplotlib.pyplot as plt
from prettytable import PrettyTable


def list_to_matrix(filename):  # 这个函数将txt文件中的数据读取出来，存进一个matrix中
    np.set_printoptions(suppress=True)  # 使输出不为科学计数法形式
    fr = open(filename)
    arrayOLines = fr.readlines()
    numberOFLines = len(arrayOLines)  # 获取此list的行数
    returnMat = np.zeros((numberOFLines, 3))  # 返回的矩阵是numberOFLines * 3 的
    index = 0
    for line in arrayOLines:
        line = line.strip()  # 移除每一行结尾的最后符号，即'\n'符；
        listFromLine = line.split(' ')   # 移除每一行中出现的' '符；
        returnMat[index, :] = listFromLine[0:3]
        index += 1
    return returnMat


def gradient_descent():
    alpha = 0.0002  # 设定学习率
    theta0 = 0.0  # 初始化参数1为0.0
    theta1 = 0.0  # 初始化参数2为0.0
    theta2 = 0.0  # 初始化参数3位0.0
    Mat = list_to_matrix('dataForTraining.txt')  # 读取txt训练集，存放在matrix中
    testing_mat = list_to_matrix('dataForTesting.txt')   # 读取txt测试集，存放在matrix中
    m = len(Mat)
    n = len(testing_mat)
    training_col_max_arr = np.max(Mat, axis=0)  # 找出训练集中每个feature的最大值
    testing_col_max_arr = np.max(testing_mat, axis=0)  # 找出测试集中每个feature的最大值
    print(testing_col_max_arr)
    for t in range(m):    # 特征缩放，归一化
        Mat[t][0] = Mat[t][0] / training_col_max_arr[0]
        Mat[t][1] = Mat[t][1] / training_col_max_arr[1]
        Mat[t][2] = Mat[t][2] / training_col_max_arr[2]
    for t in range(n):    # 特征缩放，归一化
        testing_mat[t][0] = testing_mat[t][0] / testing_col_max_arr[0]
        testing_mat[t][1] = testing_mat[t][1] / testing_col_max_arr[1]
        testing_mat[t][2] = testing_mat[t][2] / testing_col_max_arr[2]
    result_table = PrettyTable(["number of iterations", "theta0",
                                "theta1", "theta2", "training_error", "testing_error"])
    training_error_arr = []
    iter_times_arr = []
    testing_error_arr = []
    count = 1
    for j in range(1500000):   # 迭代1500000次
        sum_0 = 0
        sum_1 = 0
        sum_2 = 0
        for i in range(m):   # 根据迭代规则更新参数
            hx = theta0 + theta1*Mat[i][0] + theta2*Mat[i][1]
            diff = Mat[i][2] - hx   # 标记1：这里的符号与公式里的是反的
            sum_0 += diff * 1
            sum_1 += diff * Mat[i][0]   # 这个数值有可能会特别大
            sum_2 += diff * Mat[i][1]
        theta0 = theta0 + alpha * (1/m) * sum_0    # 标记1的符号是反的所以这里的减要变成加
        theta1 = theta1 + alpha * (1/m) * sum_1
        theta2 = theta2 + alpha * (1/m) * sum_2

        if j % 99999 == 0 and j >= 99999:   # 当迭代次数为100000的整数倍时，计算训练误差和测试误差
            iter_times_arr.append(j+count)
            temp = 0
            testing_temp = 0
            for i in range(m):
                Hx = theta0 + theta1*Mat[i][0] + theta2*Mat[i][1]
                temp += np.square(Hx-Mat[i][2])
            training_error = 0.5 * (1/m) * temp
            training_error_arr.append(training_error)

            for t in range(n):
                Hx = theta0 + theta1*testing_mat[t][0] + theta2*testing_mat[t][1]
                testing_temp += np.square(Hx-testing_mat[t][2])
            testing_error = 0.5 * (1/m) * testing_temp
            testing_error_arr.append(testing_error)

            result_table.add_row([j+count, theta0, theta1, theta2, training_error, testing_error])
            count += 1

    print(result_table)
    plt.figure()
    plt.plot(iter_times_arr, training_error_arr, 'x-', c='b', linewidth=1, label="training error")
    plt.plot(iter_times_arr, testing_error_arr, '+-', c='r', linewidth=1, label="testing error")
    plt.xlabel("iteration times")  # X轴标签
    plt.ylabel("error")   # Y轴标签
    plt.legend()    # 显示图例
    plt.show()

        
gradient_descent()
