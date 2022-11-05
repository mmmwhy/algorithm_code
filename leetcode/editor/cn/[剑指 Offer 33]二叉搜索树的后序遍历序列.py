from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def verifyPostorder(self, postorder: List[int]) -> bool:
        if len(postorder) <= 1:
            return True
        
        flag_list = [i < postorder[-1] for i in postorder[:-1]]
        
        flag = True
        change_idx = -1
        for idx, value in enumerate(flag_list):
            if value is True:
                change_idx += 1
                
                if change_idx != idx:
                    # 有多余的变动
                    flag = False
        
        if flag:
            return self.verifyPostorder(postorder[:change_idx]) and self.verifyPostorder(postorder[change_idx:-1])
        else:
            return False


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.verifyPostorder([1, 6, 3, 2, 5]))  # false
    
    print(solution.verifyPostorder([1, 3, 2, 6, 5]))  # true
    
    print(solution.verifyPostorder([1, 2, 5, 10, 6, 9, 4, 3]))  # false
    
    print(solution.verifyPostorder([5, 2, -17, -11]))  # false
    
    print(solution.verifyPostorder([5, 2, -17, -11, 25, 76, 62, 98, 92, 61]))  # false
