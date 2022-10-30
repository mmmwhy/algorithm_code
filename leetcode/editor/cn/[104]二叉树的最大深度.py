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
    
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        # 遍历
        global depth, res
        res = 0  # 记录最终深度结果
        depth = 0  # 记录当前循环中深度的结果
        
        def traverse(root: Optional[TreeNode]):
            global depth, res
            if root is None:
                return 0
            depth += 1
            if root.left is None and root.right is None:
                # 叶子节点
                res = max(res, depth)
            traverse(root.left)
            traverse(root.right)
            
            depth -= 1
            
            return res
        
        return traverse(root)
    
    def maxDepth2(self, root: Optional[TreeNode]) -> int:
        # 分解问题，当前节点的深度等于左右节点的深度之和
        if root is None:
            return 0
        left_depth = self.maxDepth(root.left)
        right_depth = self.maxDepth(root.right)
        
        return max(left_depth, right_depth) + 1


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    node1 = TreeNode(3)
    node2 = TreeNode(9)
    node3 = TreeNode(20)
    node4 = TreeNode(15)
    node5 = TreeNode(7)
    
    node1.left = node2
    node1.right = node3
    node3.left = node4
    node3.right = node5
    
    solution = Solution()
    print(solution.maxDepth(None))
