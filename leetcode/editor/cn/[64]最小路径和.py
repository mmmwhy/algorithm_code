from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        self.cache = {}
        return self.dp(grid, 0, 0)
    
    def dp(self, grid, i, j):
        # base case
        if i == len(grid) - 1:
            return sum(grid[-1][j:])
        if j == len(grid[0]) - 1:
            res = 0
            for idx in range(i, len(grid)):
                res += grid[idx][-1]
            return res
        
        if (i, j) in self.cache:
            return self.cache[(i, j)]
        
        else:
            self.cache[(i, j)] = min(self.dp(grid, i + 1, j),
                                     self.dp(grid, i, j + 1)) + grid[i][j]
            return self.cache[(i, j)]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.minPathSum(
            [[1, 4, 8, 6, 2, 2, 1, 7], [4, 7, 3, 1, 4, 5, 5, 1], [8, 8, 2, 1, 1, 8, 0, 1], [8, 9, 2, 9, 8, 0, 8, 9],
             [5, 7, 5, 7, 1, 8, 5, 5], [7, 0, 9, 4, 5, 6, 5, 6], [4, 9, 9, 7, 9, 1, 9, 0]]), 47)
    print(solution.minPathSum([[1, 3, 1], [1, 5, 1], [4, 2, 1]]), 7)
    print(solution.minPathSum([[1, 2, 3], [4, 5, 6]]), 12)
