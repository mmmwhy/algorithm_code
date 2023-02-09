import math


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        res = int(dividend / divisor)
        inf = int(math.pow(2, 31) - 1)
        _inf = -int(math.pow(2, 31))
        if res >= inf:
            return inf
        if res <= _inf:
            return _inf
        return res
# leetcode submit region end(Prohibit modification and deletion)
