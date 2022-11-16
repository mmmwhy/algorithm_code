# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def fib(self, n: int) -> int:
        if n == 0:
            return 0
        if 0 < n <= 2:
            return 1
        value = [1, 1]
        for idx in range(n - 2):
            value.append(value[-1] + value[-2])
        return value[-1]

# leetcode submit region end(Prohibit modification and deletion)
