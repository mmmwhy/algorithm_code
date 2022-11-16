# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        self.memo = {}
        return self.dp(word1, len(word1) - 1, word2, len(word2) - 1)
    
    # 定义：返回 s1[0..i] 和 s2[0..j] 的最小编辑距离
    def dp(self, word1, i, word2, j):
        # 都是 word1 变成 word2
        
        if i == -1:
            return j + 1
        if j == -1:
            return i + 1
        
        if word1[i] == word2[j]:
            return self.dp(word1, i - 1, word2, j - 1)
        
        if tuple([i, j]) not in self.memo:
            self.memo[tuple([i, j])] = min(
                    self.dp(word1, i, word2, j - 1) + 1,  # 插入
                    self.dp(word1, i - 1, word2, j) + 1,  # 删除
                    self.dp(word1, i - 1, word2, j - 1) + 1)  # 替换
        
        return self.memo[tuple([i, j])]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.minDistance("horse", "ros"))
    print(solution.minDistance("intention", "execution"))
