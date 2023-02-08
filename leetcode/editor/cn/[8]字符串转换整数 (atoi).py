import math


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def myAtoi(self, s: str) -> int:
        num_max = int(math.pow(2, 31) / 10)
        good_char = ['+', '-'] + [str(i) for i in range(10)]
        
        s = s.strip()
        
        new_s = []  # 只包含合适的数字
        flag = 1  # 初始化为 -1
        for index, c in enumerate(s):
            if len(new_s) == 0:
                # 数字前边出现字母时，直接报错
                if c not in good_char:
                    return 0
                
                # 仔细判断一下 + - 的逻辑
                if c in good_char[:2]:
                    if c == '-':
                        flag = -1
                    if index != 0:
                        return 0
                
                if c == '0':
                    continue
            
            if c in good_char[2:]:
                new_s.append(c)
            
            # 数字之后的各种小符号，全部忽略
            if len(new_s) > 0 and c not in good_char[2:]:
                break
        
        if len(new_s) > len(str(num_max)) + 1:
            if flag > 0:
                return int(math.pow(2, 31) - 1)
            else:
                return int(-math.pow(2, 31))
        
        res = 0
        for idx, c in enumerate(new_s):
            res = 10 * res + int(c)
            
            # 越界，但这里需要考虑是否为最后一个字符
            if res > num_max and idx != len(new_s) - 1:
                if flag > 0:
                    return int(math.pow(2, 31) - 1)
                elif flag < 0:
                    return int(-math.pow(2, 31))
            
            if res == num_max:
                if flag > 0 and int(new_s[-1]) >= 7:
                    return int(math.pow(2, 31) - 1)
                elif flag < 0 and int(new_s[-1]) > 7:
                    return int(-math.pow(2, 31))
        
        return res * flag


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.myAtoi("2147483800"), 2147483647)
    print(solution.myAtoi("-2147483800"), -2147483648)
    print(solution.myAtoi("2147483646"), 2147483646)
    print(solution.myAtoi("2147483648"), 2147483647)
    print(solution.myAtoi("42"), 42)
    print(solution.myAtoi("-2147483412"), -2143847412)
