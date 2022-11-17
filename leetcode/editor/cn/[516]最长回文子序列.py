# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        # s[i:j] 中的最长回文子序列的长度是 dp[i][j]
        length = len(s)
        dp = [[0 for _ in range(length)] for _ in range(length)]
        
        # i 和 j 位置相同的时候为 1
        for i in range(length):
            dp[i][i] = 1
        for i in range(length - 1, -1, -1):
            for j in range(i + 1, length):
                if s[i] == s[j]:
                    dp[i][j] = dp[i + 1][j - 1] + 2
                else:
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
        
        return dp[0][length - 1]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.longestPalindromeSubseq("cbbd"))
    print(solution.longestPalindromeSubseq("bbbab"))
