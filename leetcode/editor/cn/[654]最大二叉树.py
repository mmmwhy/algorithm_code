from typing import List, Optional


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


# leetcode submit region begin(Prohibit modification and deletion)
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def constructMaximumBinaryTree(self, nums: List[int]) -> Optional[TreeNode]:
        # 两端都是封闭区间
        return self.sub_question(nums, 0, len(nums) - 1)
    
    def sub_question(self, nums, left, right):
        if left > right:
            return None
        
        if left == right:
            return TreeNode(nums[left])
        
        # 找到最大的位置
        max_pos = 0
        max_value = -1
        for i in range(left, right + 1):
            if nums[i] > max_value:
                max_pos = i
                max_value = nums[i]
        
        tree_root = TreeNode(max_value)
        tree_root.left = self.sub_question(nums, left, max_pos - 1)
        tree_root.right = self.sub_question(nums, max_pos + 1, right)
        
        return tree_root


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    res = solution.constructMaximumBinaryTree([3])
    print(res.val)
