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
    def buildTree(self, inorder: List[int], postorder: List[int]) -> Optional[TreeNode]:
        if len(postorder) == 0:
            return
        
        if len(postorder) == 1:
            return TreeNode(postorder[-1])
        
        root_node = TreeNode(postorder[-1])
        
        # 找出 root_value 的在 inorder 的位置
        idx = 0
        for idx, value in enumerate(inorder):
            if value == postorder[-1]:
                break
        root_node.left = self.buildTree(inorder[:idx], postorder[:idx])
        root_node.right = self.buildTree(inorder[idx + 1:], postorder[idx:-1])
        
        return root_node


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    inorder = [9, 3, 15, 20, 7]
    postorder = [9, 15, 7, 20, 3]
    solution = Solution()
    res = solution.buildTree(inorder, postorder)
    print(res.val)
