# !/usr/bin/python
# -*- coding: utf-8 -*-
#
# Copyright @2022 AI, ZHIHU Inc. (zhihu.com)
#
# @author: lifeiyang <lifeiyang@zhihu.com>
# @date: 2022/11/24
#
""""""
import math


class Solution:
    def distance(self, node1, node2):
        return math.sqrt(math.pow(node1[0] - node2[0], 2) + math.pow(node1[1] - node2[1], 2))
    
    def point_mean(self, point_list):
        point_x = sum([point[0] for point in point_list]) / len(point_list)
        point_y = sum([point[1] for point in point_list]) / len(point_list)
        return (point_x, point_y)
    
    def kmeans(self, data_list, k):
        # 1、随机初始化点
        k_cluster = {}
        for i in range(k):
            k_cluster[tuple(data_list[i])] = []
        
        # 2、根据距离加入质心
        for point in data_list:
            min_distance = math.inf
            min_kernel = None
            for kernel in k_cluster:
                if min_distance > self.distance(point, kernel):
                    min_distance = self.distance(point, kernel)
                    min_kernel = kernel
            
            k_cluster[min_kernel].append(point)
        
        # 3、开始循环迭代
        k_kernel_old = k_cluster.copy()
        while True:
            # 新一轮的迭代
            # 1、寻找当前的质心
            k_cluster = {}
            for kernel in k_kernel_old:
                kernel_mean = self.point_mean(k_kernel_old[kernel])
                k_cluster[kernel_mean] = []
            
            # 2、根据距离加入质心
            for point in data_list:
                min_distance = math.inf
                min_kernel = None
                for kernel in k_cluster:
                    if min_distance > self.distance(point, kernel):
                        min_distance = self.distance(point, kernel)
                        min_kernel = kernel
                k_cluster[min_kernel].append(point)
            
            if k_cluster == k_kernel_old:
                print("final kmeans:", k_cluster)
                break
            else:
                k_kernel_old = k_cluster.copy()
                print("now kmeans:", k_cluster)


if __name__ == "__main__":
    solution = Solution()
    print(solution.kmeans([[0, 5], [0, 6], [4, 0], [5, 0]], 2))
