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
        self.last_node_val = None
        self.is_valid_bst = True
    
    def in_order(self, root: TreeNode):
        if root is None:
            return
        
        self.in_order(root.left)
        if self.last_node_val is None:
            self.last_node_val = root.val
        
        elif self.last_node_val < root.val:
            self.last_node_val = root.val
        
        else:
            self.is_valid_bst = False
        
        self.in_order(root.right)
    
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        self.in_order(root)
        return self.is_valid_bst


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
    print(solution.isValidBST(node5))
    
    node3 = TreeNode(3)
    node4 = TreeNode(4)
    node5 = TreeNode(5)
    node6 = TreeNode(6)
    node7 = TreeNode(7)
    
    node5.left = node4
    node5.right = node6
    node6.left = node3
    node6.right = node7
    print(solution.isValidBST(node5))
