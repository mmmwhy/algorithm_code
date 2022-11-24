import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def minimumEffortPath(self, heights: List[List[int]]) -> int:
        m, n = len(heights), len(heights[0])
        
        # 出发点
        queue = [[[0, 0], 0]]
        distance_from_index = [[math.inf for _ in range(n)] for _ in range(m)]
        distance_from_index[0][0] = 0
        
        while len(queue) > 0:
            from_node, from_distance = queue.pop(0)
            for move in [[-1, 0], [1, 0], [0, -1], [0, 1]]:
                neighbor = [from_node[0] + move[0], from_node[1] + move[1]]
                if 0 <= neighbor[0] < m and 0 <= neighbor[1] < n:
                    # 判断是否越界
                    neighbor_distance = max(
                            distance_from_index[from_node[0]][from_node[1]],
                            abs(
                                    heights[from_node[0]][from_node[1]] -
                                    heights[neighbor[0]][neighbor[1]]
                            )
                    )
                    if neighbor_distance < distance_from_index[neighbor[0]][neighbor[1]]:
                        distance_from_index[neighbor[0]][neighbor[1]] = neighbor_distance
                        queue.append([neighbor, neighbor_distance])
        
        return distance_from_index[m - 1][n - 1]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.minimumEffortPath([[1, 10, 6, 7, 9, 10, 4, 9]]), 9)
    print(solution.minimumEffortPath([[1, 2, 2], [3, 8, 2], [5, 3, 5]]), 2)
    print(solution.minimumEffortPath(
            [[1, 2, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 1, 1, 2, 1]]), 0)
    print(solution.minimumEffortPath([[1, 2, 3], [3, 8, 4], [5, 3, 5]]), 1)
