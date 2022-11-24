import string


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def build_kmp(self, needle):
        # 定义 dp[i][j] 为: 在第 i 个位置，遇到 j 字母，应该去的位置
        dp = {}
        for i in range(len(needle)):
            dp[i] = {}
            for j in string.ascii_lowercase:
                dp[i][j] = 0
        
        # 基础情况，在第 0 个位置，遇到第 0 个字母，应该跳转到第 1 个位置
        dp[0][needle[0]] = 1
        
        # X 为跟随在 i 后边的重叠子问题状态
        X = 0
        for i in range(1, len(needle)):
            for j in string.ascii_lowercase:
                if j == needle[i]:
                    dp[i][j] = i + 1
                else:
                    dp[i][j] = dp[X][j]
            X = dp[X][needle[i]]
        return dp
    
    def strStrKMP(self, haystack: str, needle: str) -> int:
        kmp_pattern_dp = self.build_kmp(needle)
        m, n = len(needle), len(haystack)
        j = 0
        for idx, char in enumerate(haystack):
            j = kmp_pattern_dp[j][char]
            if j == m:
                return idx - m + 1
        
        return -1
    
    def strStr(self, haystack: str, needle: str) -> int:
        res = -1
        m, n = len(haystack), len(needle)
        if m < n:
            return res
        
        for idx in range(m - n + 1):
            if haystack[idx:idx + n] == needle:
                return idx
        return res


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.strStr("a", "a"), 0)
    print(solution.strStr("sadbutsad", "sad"), 0)
    print(solution.strStr("leetcode", "leeto"), -1)
