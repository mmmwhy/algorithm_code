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
    def bstFromPreorder(self, preorder: List[int]) -> Optional[TreeNode]:
        # 两侧封闭的
        return self.build(preorder, 0, len(preorder) - 1)
    
    def build(self, preorder, left, right) -> Optional[TreeNode]:
        if left > right:
            return
        root_node = TreeNode(preorder[left])
        
        # 找到 root_node 的左节点出来
        p = left + 1
        while p <= right and preorder[p] < preorder[left]:
            p += 1
        root_node.left = self.build(preorder, left + 1, p - 1)
        root_node.right = self.build(preorder, p, right)
        
        return root_node


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    res = solution.bstFromPreorder([8, 5, 1, 7, 10, 12])
    print(res.val)
    
    res = solution.bstFromPreorder([1, 3])
    print(res.val)
    
    res = solution.bstFromPreorder([4, 2])
    print(res.val)
