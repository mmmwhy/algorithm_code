from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def possibleBipartition(self, n: int, dislikes: List[List[int]]) -> bool:
        graph = self.build_graph(dislikes)
        self.visited = [False] * n
        self.flag = True
        
        for node_idx in range(n):
            if not self.visited[node_idx]:
                self.node_side = {node_idx: 0}
                self.traverse(graph, node_idx)
        
        return self.flag
    
    def traverse(self, graph, node_idx):
        self.visited[node_idx] = True
        for neighbor in graph[node_idx]:
            if not self.visited[neighbor]:
                # 没有访问过
                self.node_side[neighbor] = 1 - self.node_side[node_idx]
                self.traverse(graph, neighbor)
            elif self.node_side[neighbor] != 1 - self.node_side[node_idx]:
                # 访问过，但是节点关系不正确
                self.flag = False
    
    def build_graph(self, dislikes):
        from collections import defaultdict
        graph = defaultdict(list)
        for pair in dislikes:
            graph[pair[0] - 1].append(pair[1] - 1)
            graph[pair[1] - 1].append(pair[0] - 1)
        return graph


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.possibleBipartition(4, [[1, 2], [1, 3], [2, 4]]), True)
    print(solution.possibleBipartition(3, [[1, 2], [1, 3], [2, 3]]), False)
    print(solution.possibleBipartition(5, [[1, 2], [2, 3], [3, 4], [4, 5], [1, 5]]), False)
