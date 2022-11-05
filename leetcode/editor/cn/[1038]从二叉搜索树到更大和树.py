# leetcode submit region begin(Prohibit modification and deletion)
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def __init__(self):
        self.last_val = 0
    
    def bstToGst(self, root: TreeNode) -> TreeNode:
        # 递归
        if root is None:
            return
        
        self.bstToGst(root.right)
        root.val = self.last_val + root.val
        self.last_val = root.val
        self.bstToGst(root.left)
        
        return root

# leetcode submit region end(Prohibit modification and deletion)
