from typing import Optional, List


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
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> List[List[int]]:
        # 边缘情况
        if root is None:
            return []
        
        self.res = []
        self.traverse(root, targetSum, [root.val])
        return self.res
    
    def traverse(self, root, target_sum, track_list):
        
        # 处理当前节点
        if root.left is None and root.right is None:
            # 叶子节点了
            if sum(track_list) == target_sum:
                self.res.append(track_list.copy())
            else:
                return
        
        if root.left is not None:
            self.traverse(root.left, target_sum, track_list + [root.left.val])
        
        if root.right is not None:
            self.traverse(root.right, target_sum, track_list + [root.right.val])


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    root = [5, 4, 8, 11, None, 13, 4, 7, 2, None, None, 5, 1]
    
    tree_root = TreeNode(root.pop(0))
    q = [tree_root]
    
    while len(root) > 0:
        temp_root = q.pop(0)
        value = root.pop(0)
        if value is not None:
            left = TreeNode(value)
            temp_root.left = left
            q.append(left)
        
        value = root.pop(0)
        if value is not None:
            right = TreeNode(value)
            temp_root.right = right
            q.append(right)
    
    print(solution.pathSum(tree_root, 22))
