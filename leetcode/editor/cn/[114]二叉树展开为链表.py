#!/usr/bin/env Python
# coding=utf-8

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
        self.new_root = TreeNode(-1)
        self.cur_node = self.new_root
    
    def flatten1(self, root: Optional[TreeNode]) -> None:
        """
        Do not return anything, modify root in-place instead.
        """
        # 遍历的方法
        self.traverse(root)
        if root is not None:
            root.right = self.new_root.right.right
            root.left = None
    
    def traverse(self, root: Optional[TreeNode]):
        # do something
        if root is None:
            return
        self.cur_node.right = TreeNode(root.val)
        self.cur_node = self.cur_node.right
        
        self.traverse(root.left)
        self.traverse(root.right)
    
    def flatten(self, root: Optional[TreeNode]) -> None:
        # 可以用分解的方式来做，函数确保返回将左子树放在右边的结果即可
        if root is None:
            return
        self.flatten(root.left)
        self.flatten(root.right)
        
        node_left = root.left
        
        if node_left is not None:
            while node_left.right is not None:
                node_left = node_left.right
            
            node_left.right = root.right
            root.right = root.left
            root.left = None


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    # 根据层序遍历结构，构造树
    nums = [1, 2, 3, 4, 5, 6, 7]
    node_list = [TreeNode(i) for i in nums]
    node_list[0].left = node_list[1]
    node_list[0].right = node_list[2]
    
    node_list[1].left = node_list[3]
    node_list[1].right = node_list[4]
    
    node_list[2].left = node_list[5]
    node_list[2].right = node_list[6]
    
    q = node_list[0]
    
    solution = Solution()
    solution.flatten(q)
