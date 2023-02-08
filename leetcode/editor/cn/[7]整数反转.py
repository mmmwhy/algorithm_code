# leetcode submit region begin(Prohibit modification and deletion)
import math


class Solution:
    def reverse(self, x: int) -> int:
        res = 0
        flag = 1
        if x < 0:
            flag = -1
            x = -x
        num_max = int(math.pow(2, 31) / 10)
        while x:
            num = x % 10
            x = int(x / 10)
            
            res = 10 * res + num
            # 最后一位越界就不算
            if res > num_max and x != 0:
                return 0
        
        return res * flag


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.reverse(-2147483412), -2143847412)
    print(solution.reverse(1534236469), 0)
    print(solution.reverse(1), 1)
    print(solution.reverse(-123), -321)
    print(solution.reverse(123), 321)
    print(solution.reverse(120), 21)
    print(solution.reverse(0), 0)
