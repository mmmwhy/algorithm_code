from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxProbability(self, n: int, edges: List[List[int]], succProb: List[float], start: int, end: int) -> float:
        # 权重
        weight = {}
        for edge, prob in zip(edges, succProb):
            weight[tuple([edge[0], edge[1]])] = prob
            weight[tuple([edge[1], edge[0]])] = prob
        
        graph = self.build_graph(n, edges)
        
        # 每个点距离 start 的距离, start 本身为 0
        distance_to_start = [0] * n
        distance_to_start[start] = 1
        
        # 开始 bfs
        queue = [[start, 1]]
        while len(queue) > 0:
            from_node, from_distance = queue.pop(0)
            if from_distance < distance_to_start[from_node]:
                # 已经有概率更大的实现了
                continue
            
            for neighbor_node in graph[from_node]:
                if tuple([from_node, neighbor_node]) in weight:
                    neighbor_distance = distance_to_start[from_node] * weight[tuple([from_node, neighbor_node])]
                    if distance_to_start[neighbor_node] < neighbor_distance:
                        distance_to_start[neighbor_node] = neighbor_distance
                        queue.append([neighbor_node, neighbor_distance])
        
        return distance_to_start[end]
    
    def build_graph(self, n, edges):
        graph = [[] for _ in range(n)]
        for edge in edges:
            from_node, to_node = edge
            graph[from_node].append(to_node)
            graph[to_node].append(from_node)
        return graph


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    
    n = 5
    edges = [[1, 4], [2, 4], [0, 4], [0, 3], [0, 2], [2, 3]]
    succProb = [0.37, 0.17, 0.93, 0.23, 0.39, 0.04]
    start = 3
    end = 4
    print(solution.maxProbability(n, edges, succProb, start, end), 0.2139)
    
    n = 3
    edges = [[0, 1]]
    succProb = [0.5]
    start = 0
    end = 2
    print(solution.maxProbability(n, edges, succProb, start, end), 0)
    
    n = 3
    edges = [[0, 1], [1, 2], [0, 2]]
    succProb = [0.5, 0.5, 0.2]
    start = 0
    end = 2
    
    print(solution.maxProbability(n, edges, succProb, start, end), 0.25)
    
    n = 3
    edges = [[0, 1], [1, 2], [0, 2]]
    succProb = [0.5, 0.5, 0.3]
    start = 0
    end = 2
    print(solution.maxProbability(n, edges, succProb, start, end), 0.3)
