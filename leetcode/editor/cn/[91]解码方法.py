# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def numDecodings(self, s: str) -> int:
        # 处理边界条件
        if s[0] == '0':
            return 0
        
        # dp[i] 表示前i个字符串，最多可以有多少种解码方法
        m = len(s)
        dp = [0 for _ in range(m + 1)]
        
        # 空字符串可以有 1 种解码方法，解码出一个空字符串。
        dp[0] = 1
        dp[1] = 1
        
        for i in range(2, m + 1):
            if s[i - 1] != '0':
                dp[i] = dp[i - 1]
            if 10 <= int(s[i - 2:i]) <= 26:
                dp[i] += dp[i - 2]
        
        return dp[m]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.numDecodings("10"), 1)
    print(solution.numDecodings("12"), 2)
    print(solution.numDecodings("226"), 3)
    print(solution.numDecodings("06"), 0)
