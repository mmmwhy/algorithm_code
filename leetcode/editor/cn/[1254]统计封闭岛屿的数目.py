from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])
        for i in range(m):
            self.dfs(grid, i, 0)
            self.dfs(grid, i, n - 1)
        
        for j in range(n):
            self.dfs(grid, 0, j)
            self.dfs(grid, m - 1, j)
        
        res = 0
        for i in range(m):
            for j in range(n):
                if grid[i][j] == 0:
                    res += 1
                    self.dfs(grid, i, j)
        return res
    
    def dfs(self, grid: List[List[int]], i, j):
        m, n = len(grid), len(grid[0])
        if i < 0 or i >= m or j < 0 or j >= n:
            return 0
        if grid[i][j] == 1:
            return 0
        
        grid[i][j] = 1
        self.dfs(grid, i + 1, j)
        self.dfs(grid, i - 1, j)
        self.dfs(grid, i, j + 1)
        self.dfs(grid, i, j - 1)
# leetcode submit region end(Prohibit modification and deletion)
