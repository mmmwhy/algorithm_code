from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        graph = self.build_graph(prerequisites)
        
        self.visited = [False] * numCourses
        self.on_path = [False] * numCourses
        self.has_cycle = False
        
        self.post_order = []
        
        for node in range(numCourses):
            self.traverse(graph, node)
        if self.has_cycle:
            return []
        else:
            return list(reversed(self.post_order))
    
    def traverse(self, graph, node):
        if self.on_path[node]:
            self.has_cycle = True
        if self.visited[node]:
            return
        
        self.visited[node] = True
        self.on_path[node] = True
        
        for neighbor in graph[node]:
            self.traverse(graph, neighbor)
        
        self.post_order.append(node)
        
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
    print(solution.findOrder(2, [[1, 0]]), [0, 1])
    print(solution.findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]]), [0, 2, 1, 3])
