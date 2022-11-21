from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def diffWaysToCompute(self, expression: str) -> List[int]:
        res = []
        for idx, c in enumerate(expression):
            if c in ["*", "-", "+"]:
                left_list = self.diffWaysToCompute(expression[:idx])
                right_list = self.diffWaysToCompute(expression[idx + 1:])
                for left in left_list:
                    for right in right_list:
                        if c == "*":
                            res.append(left * right)
                        if c == "-":
                            res.append(left - right)
                        if c == "+":
                            res.append(left + right)
        
        if len(res) == 0:
            # 说明其中没有 * - + 等符号，纯数字
            res.append(int(expression))
        return res


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.diffWaysToCompute("2*3-4*5"))
