# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        m = len(word1)
        n = len(word2)
        
        dp = [[0 for _ in range(n + 1)] for _ in range(m + 1)]
        for i in range(m + 1):
            for j in range(n + 1):
                if i == 0:
                    # i 为 0 ，那就需要修改 j 步
                    dp[i][j] = j
                elif j == 0:
                    dp[i][j] = i
                elif word1[i - 1] == word2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                elif word1[i - 1] != word2[j - 1]:
                    dp[i][j] = min(
                            dp[i - 1][j - 1] + 1,
                            dp[i - 1][j] + 1,
                            dp[i][j - 1] + 1)
        
        return dp[m][n]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.minDistance("horse", "ros"))
    print(solution.minDistance("intention", "execution"))
