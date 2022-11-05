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
    
    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        if root is None:
            return None
        
        if root.val == key:
            if root.left is None and root.right is None:
                # 叶子节点直接删除
                return None
            elif root.left is None and root.right is not None:
                # 右子树不为空
                return root.right
            elif root.right is None and root.left is not None:
                # 左子树不为空
                return root.left
            else:
                # 左右都不空
                left_node = root.left
                while left_node.right is not None:
                    left_node = left_node.right
                # 删除左子树中最大的点
                root.left = self.deleteNode(root.left, left_node.val)
                
                left_node.left = root.left
                left_node.right = root.right
                root = left_node
                # 左节点的最右侧节点
        elif key < root.val:
            root.left = self.deleteNode(root.left, key)
        elif key > root.val:
            root.right = self.deleteNode(root.right, key)
        
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
    res = solution.deleteNode(node5, 5)
    print(res.val)
