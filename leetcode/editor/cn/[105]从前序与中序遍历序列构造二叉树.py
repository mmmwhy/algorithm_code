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
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        
        if len(preorder) == 0:
            return None
        
        root_node = TreeNode(preorder[0])
        if len(preorder) == 1:
            return root_node
        
        root_pos = -1
        for idx, value in enumerate(inorder):
            if value == preorder[0]:
                root_pos = idx
        
        root_node.left = self.buildTree(preorder[1:1 + root_pos], inorder[0:root_pos])
        root_node.right = self.buildTree(preorder[1 + root_pos:], inorder[root_pos + 1:])
        
        return root_node


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    preorder = [3, 9, 20, 15, 7]
    inorder = [9, 3, 15, 20, 7]
    solution = Solution()
    res = solution.buildTree(preorder, inorder)
    print(res.val)
