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
        self.k = 0
        self.kth_count = 0
        self.kth_node = None
    
    def inorder_traverse(self, root: TreeNode):
        if root is None:
            return
        self.inorder_traverse(root.left)
        self.kth_count += 1
        if self.kth_count == self.k:
            self.kth_node = root
        else:
            self.inorder_traverse(root.right)
    
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        self.k = k
        self.inorder_traverse(root)
        return self.kth_node.val


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
    node2.right = node1
    
    solution = Solution()
    print(solution.kthSmallest(node5, 3))
