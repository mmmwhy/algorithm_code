import math
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
        self.max_diff = -1
    
    def maxAncestorDiff(self, root: Optional[TreeNode]) -> int:
        if root is None:
            return 0
        
        self.findMaxMinSon(root)
        
        return self.max_diff
    
    def findMaxMinSon(self, root):
        if root.left is None and root.right is None:
            return root.val, root.val
        
        if root.left is not None:
            left_max, left_min = self.findMaxMinSon(root.left)
        else:
            left_max, left_min = -math.inf, math.inf
        
        if root.right is not None:
            right_max, right_min = self.findMaxMinSon(root.right)
        else:
            right_max, right_min = -math.inf, math.inf
        
        self.max_diff = max(self.max_diff,
                            abs(max(left_max, right_max) - root.val),
                            abs(min(left_min, right_min) - root.val))
        
        return max([left_max, right_max, root.val]), min([left_min, right_min, root.val])


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    node1 = TreeNode(1)
    node2 = TreeNode(2)
    node3 = TreeNode(3)
    node4 = TreeNode(4)
    node5 = TreeNode(5)
    
    node1.left = node2
    node1.right = node3
    # node3.left = node4
    node3.right = node5
    
    solution = Solution()
    print(solution.maxAncestorDiff(node1))
