from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        m = len(s)
        
        # 定义 dp[i] 为前 i 个字符是否可以用字典拼出结果
        dp = [False for _ in range(m + 1)]
        dp[0] = True
        
        for i in range(1, m + 1):
            for word in wordDict:
                # 当前 i 的值，仅依赖于 i - word
                if i - len(word) >= 0:
                    if s[i - len(word):i] == word:
                        dp[i] = dp[i] or dp[i - len(word)]
        
        return dp[m]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]), False)
    print(solution.wordBreak("leetcode", ["leet", "code"]), True)
    print(solution.wordBreak("applepenapple", ["apple", "pen"]), True)
