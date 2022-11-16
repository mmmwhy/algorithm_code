from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        res = 0
        m, n = len(grid), len(grid[0])
        for i in range(m):
            for j in range(n):
                if grid[i][j] == 1:
                    res = max(self.dfs(grid, i, j), res)
        return res
    
    def dfs(self, grid: List[List[int]], i, j):
        m, n = len(grid), len(grid[0])
        if i < 0 or i >= m or j < 0 or j >= n:
            return 0
        
        if grid[i][j] == 0:
            return 0
        # 访问过了
        grid[i][j] = 0
        return self.dfs(grid, i - 1, j) + \
               self.dfs(grid, i + 1, j) + \
               self.dfs(grid, i, j + 1) + \
               self.dfs(grid, i, j - 1) + 1


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    grid = [[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
            [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
            [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]
    print(solution.maxAreaOfIsland(grid))
