# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def longestPalindrome(self, s: str) -> str:
        # 边界条件
        if len(s) == 0:
            return ""
        
        # s[i:j] 为最长回文子串的长度是 dp[i][j]
        length = len(s)
        dp = [[0 for _ in range(length)] for _ in range(length)]
        for i in range(length):
            dp[i][i] = 1
        
        max_length = 1
        max_str = s[0]
        
        for i in range(length - 1, -1, -1):
            for j in range(i + 1, length):
                if s[i] == s[j] and (j - i == 1 or dp[i + 1][j - 1] != 0):
                    dp[i][j] = dp[i + 1][j - 1] + 2
                
                if dp[i][j] > max_length:
                    max_length = dp[i][j]
                    max_str = s[i:j + 1]
        
        return max_str


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.longestPalindrome("cbbd"), "bb")
    print(solution.longestPalindrome("aacabdkacaa"), "aca")
    print(solution.longestPalindrome("ac"), "a")
    print(solution.longestPalindrome("a"), "a")
    print(solution.longestPalindrome("babad"), "bab")
    print(solution.longestPalindrome("cbbd"), "bb")
