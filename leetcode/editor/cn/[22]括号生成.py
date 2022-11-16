from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.res = []
    
    def generateParenthesis(self, n: int) -> List[str]:
        self.dfs(n, [], n, n)
        return self.res
    
    def dfs(self, n, track_list, left_count, right_count):
        if len(track_list) == n * 2:
            self.res.append("".join(track_list))
        
        if left_count == 0 and right_count == 0:
            return
        
        # 左括号剩余数量大于右括号的数量，剪枝
        if left_count > right_count:
            return
        
        # 做选择
        if left_count > 0:
            track_list.append("(")
            self.dfs(n, track_list, left_count - 1, right_count)
            # 撤销选择
            track_list.pop(-1)
        
        if right_count > 0:
            # 做选择
            track_list.append(")")
            self.dfs(n, track_list, left_count, right_count - 1)
            # 撤销选择
            track_list.pop(-1)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.generateParenthesis(2))
