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
    def search(self, root: Optional[TreeNode], val: int):
        
        if val < root.val:
            if root.left is None:
                root.left = TreeNode(val)
            else:
                self.search(root.left, val)
        else:
            if root.right is None:
                root.right = TreeNode(val)
            else:
                self.search(root.right, val)
    
    def insertIntoBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        if root is None:
            return TreeNode(val)
        
        self.search(root, val)
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
    res = solution.insertIntoBST(None, 7)
    print(res.val)
