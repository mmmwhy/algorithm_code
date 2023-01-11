# leetcode submit region begin(Prohibit modification and deletion)
from collections import Counter
from typing import List


class Solution:
    def findMaxForm(self, strs: List[str], m: int, n: int) -> int:
        res = 0
        # 前 i 个数字，在 「0 的数量不超过 j， 1 的数量不超过 k」 的前提下，所能达到的最大值
        
        dp = [[[0 for _ in range(n + 1)] for _ in range(m + 1)] for _ in range(len(strs) + 1)]
        
        for i in range(1, len(strs) + 1):
            counter = Counter(strs[i - 1])
            count_0 = counter['0']
            count_1 = counter['1']
            
            for j in range(0, m + 1):
                for k in range(0, n + 1):
                    if j < count_0 or k < count_1:
                        dp[i][j][k] = dp[i - 1][j][k]
                    else:
                        dp[i][j][k] = max(dp[i - 1][j][k], dp[i - 1][j - count_0][k - count_1] + 1)
        
        return dp[len(strs)][m][n]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    
    strs = ["10", "0001", "111001", "1", "0"]
    m = 5
    n = 3
    print(solution.findMaxForm(strs, m, n), 4)
    
    strs = ["10", "0", "1"]
    m = 1
    n = 1
    print(solution.findMaxForm(strs, m, n), 2)
