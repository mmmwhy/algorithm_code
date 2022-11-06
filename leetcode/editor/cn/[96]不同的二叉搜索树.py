# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.factorial = {0: 1, 1: 1, 2: 2}
    
    def numTrees(self, n: int) -> int:
        if n in self.factorial:
            return self.factorial[n]
        
        for value in range(3, n + 1):
            res = 0
            for idx in range(value):
                left_part = self.factorial[idx]
                right_part = self.factorial[value - idx - 1]
                res += (left_part * right_part)
                self.factorial[value] = res
        
        return self.factorial[n]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.numTrees(3) == 5)
    print(solution.numTrees(4) == 14)
    print(solution.numTrees(5) == 42)
    print(solution.numTrees(19))
