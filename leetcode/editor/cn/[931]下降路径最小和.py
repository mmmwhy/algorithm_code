from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def minFallingPathSum(self, matrix: List[List[int]]) -> int:
        n = len(matrix)
        dp = [[0] * n for _ in range(n)]
        # 初始化第一行的值
        for j in range(n):
            dp[0][j] = matrix[0][j]
        
        for i in range(1, n):
            for j in range(n):
                last_list = [dp[i - 1][j]]
                if j > 0:
                    last_list.append(dp[i - 1][j - 1])
                if j < n - 1:
                    last_list.append(dp[i - 1][j + 1])
                
                dp[i][j] = min(last_list) + matrix[i][j]
        return min(dp[-1])


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.minFallingPathSum([[-19]]))
