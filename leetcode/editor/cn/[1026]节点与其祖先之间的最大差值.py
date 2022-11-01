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
        
        # 计算每一个节点
        max_value = -1
        min_value = math.inf
        max_value, min_value = self.findMaxMinSon(root, max_value, min_value)
        root_max_diff = max(abs(root.val - max_value), abs(root.val - min_value))
        
        left_max_diff = self.maxAncestorDiff(root.left)
        right_max_diff = self.maxAncestorDiff(root.right)
        
        return max(root_max_diff, left_max_diff, right_max_diff)
    
    def findMaxMinSon(self, root, max_value, min_value):
        if root is None:
            return max_value, min_value
        
        max_value = max(max_value, root.val)
        min_value = min(min_value, root.val)
        
        left_max, left_min = self.findMaxMinSon(root.left, max_value, min_value)
        right_max, right_min = self.findMaxMinSon(root.right, max_value, min_value)
        
        return max([left_max, left_min, right_max, right_min]), min([left_max, left_min, right_max, right_min])


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    node1 = TreeNode(1)
    node2 = TreeNode(2)
    node3 = TreeNode(3)
    node4 = TreeNode(4)
    node5 = TreeNode(5)
    
    node1.left = node2
    node1.right = node3
    node3.left = node4
    node3.right = node5
    
    solution = Solution()
    print(solution.maxAncestorDiff(node1))
