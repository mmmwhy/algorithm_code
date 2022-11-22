from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        self.res = []
        self.traverse(graph, 0, len(graph) - 1, [])
        return self.res
    
    def traverse(self, graph, node_idx, target_idx, track_list):
        if node_idx == target_idx:
            self.res.append(track_list + [target_idx])
        
        track_list.append(node_idx)
        for neighbor_node in graph[node_idx]:
            self.traverse(graph, neighbor_node, target_idx, track_list)
        track_list.pop(-1)


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.allPathsSourceTarget([[4, 3, 1], [3, 2, 4], [3], [4], []]))
