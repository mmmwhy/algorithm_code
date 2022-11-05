from typing import Optional


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
    def __init__(self):
        self.last_val = 0
    
    def convertBST(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        # 递归
        if root is None:
            return
        
        self.convertBST(root.right)
        root.val = self.last_val + root.val
        self.last_val = root.val
        self.convertBST(root.left)
        
        return root


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    node1 = TreeNode(1)
    node2 = TreeNode(2)
    node3 = TreeNode(3)
    node4 = TreeNode(4)
    node5 = TreeNode(5)
    node6 = TreeNode(6)
    
    node5.left = node3
    node5.right = node6
    node3.left = node2
    node3.right = node4
    node2.left = node1
    
    solution = Solution()
    res = solution.convertBST(node5)
    print(res)
