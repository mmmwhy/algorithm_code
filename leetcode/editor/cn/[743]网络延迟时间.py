import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:
        # 构造 graph 和 边的权重，所有都 - 1
        graph = [[] for _ in range(n)]
        weight = [[0 for _ in range(n)] for _ in range(n)]
        for source_node, target_node, value in times:
            graph[source_node - 1].append(target_node - 1)
            weight[source_node - 1][target_node - 1] = value
        
        # 一开始距离是无穷远
        distance_from_k = [math.inf] * n
        
        # 初始节点
        distance_from_k[k - 1] = 0
        queue = [[k - 1, 0]]
        while len(queue) > 0:
            from_node, from_distance = queue.pop(0)
            if from_distance > distance_from_k[from_node]:
                continue
            
            for neighbor in graph[from_node]:
                neighbor_distance = distance_from_k[from_node] + weight[from_node][neighbor]
                if neighbor_distance < distance_from_k[neighbor]:
                    distance_from_k[neighbor] = neighbor_distance
                    queue.append([neighbor, neighbor_distance])
        
        if math.inf in distance_from_k:
            return -1
        else:
            return max(distance_from_k)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2), 2)
    print(solution.networkDelayTime([[1, 2, 1]], 2, 1), 1)
    print(solution.networkDelayTime([[1, 2, 1]], 2, 2), -1)
