from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        # 实现 DFS
        graph = self.build_graph(prerequisites)
        
        self.visited = [False] * numCourses
        self.on_path = [False] * numCourses
        self.has_cycle = False
        
        for node in range(numCourses):
            self.traverse(graph, node)
        
        return not self.has_cycle
    
    def traverse(self, graph, node):
        if self.on_path[node]:
            self.has_cycle = True
        
        if self.visited[node]:
            return
        
        self.visited[node] = True
        self.on_path[node] = True
        for neighbor in graph[node]:
            self.traverse(graph, neighbor)
        self.on_path[node] = False
    
    def build_graph(self, prerequisites):
        from collections import defaultdict
        graph = defaultdict(list)
        for to_node, from_node in prerequisites:
            graph[from_node].append(to_node)
        return graph


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.canFinish(20, [[0, 10], [3, 18], [5, 5], [6, 11], [11, 14], [13, 1], [15, 1], [17, 4]]), False)
    print(solution.canFinish(2, [[1, 0], [0, 1]]), False)
    print(solution.canFinish(2, [[1, 0]]), True)
