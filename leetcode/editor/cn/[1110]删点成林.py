from typing import Optional, List


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
    def delNodes(self, root: Optional[TreeNode], to_delete: List[int]) -> List[TreeNode]:
        self.to_delete = to_delete
        self.res = []
        
        self.helper(root)
        
        return self.res
    
    def helper(self, root):
        if not root:
            return root
        
        root.left = self.helper(root.left)
        root.right = self.helper(root.right)
        
        if root.val in self.to_delete:
            if root.left:
                self.res.append(root.left)
            if root.right:
                self.res.append(root.right)
            
            root = None
        return root

# leetcode submit region end(Prohibit modification and deletion)
