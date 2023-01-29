from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def lastStoneWeightII(self, stones: List[int]) -> int:
        """
        题目可以抽象为：石头重量之间进行 +、- 符号的组合， 使用最后的结果最小。
        记：石头的总重量为 sum、+ 的石头总重量为 pos、 - 的石头总重量为 neg：
        -> pos = sum - neg
        -> pos - neg = sum - 2 * neg
        -> sum - 2 * neg 取最小值时，满足题目要求。
        -> 为满足题目要求， neg 需要在不超过 sum/2 的前提下，尽可能的大。
        
        -> 最终题目转化为，在 stones 在 sum/2 最多可以占用的空间
        """
        
        m = len(stones)
        total = sum(stones)
        n = total // 2
        
        # 定义 dp[i][j] 为前 i 个石头是否可以凑出重量 j
        dp = [[False for _ in range(n + 1)] for _ in range(m + 1)]
        dp[0][0] = True
        
        for i in range(1, m + 1):
            for j in range(n + 1):
                if j < stones[i - 1]:
                    dp[i][j] = dp[i - 1][j]
                else:
                    dp[i][j] = dp[i - 1][j] or dp[i - 1][j - stones[i - 1]]
        
        # 找到 dp[m] 行中，最后一个为 1 的位置，此时即为 neg 的值，带入 sum - 2 * neg
        ans = None
        for j in range(n, -1, -1):
            if dp[m][j]:
                ans = total - 2 * j
                break
        return ans


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.lastStoneWeightII([1, 2]), 1)
    print(solution.lastStoneWeightII([2, 7, 4, 1, 8, 1]), 1)
    print(solution.lastStoneWeightII([31, 26, 33, 21, 40]), 5)
