from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def isBipartite(self, graph: List[List[int]]) -> bool:
        # 第一个点在 0 侧，第一个点的邻居应该在 1 侧
        self.flag = True
        # 主要是这里，需要考虑
        for idx in range(len(graph)):
            self.visited = [False] * len(graph)
            self.node_side = {idx: 0}
            self.bfs(graph, idx)
        return self.flag
    
    def traverse(self, graph, node_idx):
        self.visited[node_idx] = True
        
        for neighbor in graph[node_idx]:
            if not self.visited[neighbor]:
                # 没有访问过
                self.node_side[neighbor] = 1 - self.node_side[node_idx]
                self.traverse(graph, neighbor)
            elif self.node_side[neighbor] == self.node_side[node_idx]:
                self.flag = False
    
    def bfs(self, graph, node_idx):
        self.visited[node_idx] = True
        q = [node_idx]
        while len(q) > 0:
            cur = q.pop(0)
            for neighbor in graph[cur]:
                if not self.visited[neighbor]:
                    self.node_side[neighbor] = 1 - self.node_side[cur]
                    self.visited[neighbor] = True
                    q.append(neighbor)
                elif self.node_side[neighbor] == self.node_side[cur]:
                    self.flag = False
                    return


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.isBipartite(
            [[], [2, 4, 6], [1, 4, 8, 9], [7, 8], [1, 2, 8, 9], [6, 9], [1, 5, 7, 8, 9], [3, 6, 9], [2, 3, 4, 6, 9],
             [2, 4, 5, 6, 7, 8]]), False)
    print(solution.isBipartite([[], [3], [], [1], []]), True)
    print(solution.isBipartite([[1, 2, 3], [0, 2], [0, 1, 3], [0, 2]]), False)
    print(solution.isBipartite([[1, 3], [0, 2], [1, 3], [0, 2]]), True)
    print(solution.isBipartite([[0]]), False)
