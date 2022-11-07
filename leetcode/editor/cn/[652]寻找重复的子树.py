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
    def __init__(self):
        self.res = []
        self.sub_tree_str_count = {}
    
    def findDuplicateSubtrees(self, root: Optional[TreeNode]) -> List[Optional[TreeNode]]:
        self.traverse(root)
        return self.res
    
    def traverse(self, root: Optional[TreeNode]):
        if not root:
            return "#"
        
        left = self.traverse(root.left)
        right = self.traverse(root.right)
        
        sub_tree_str = left + "," + right + "," + str(root.val)
        
        if sub_tree_str not in self.sub_tree_str_count:
            self.sub_tree_str_count[sub_tree_str] = 1
        else:
            self.sub_tree_str_count[sub_tree_str] += 1
        
        if self.sub_tree_str_count[sub_tree_str] == 2:
            self.res.append(root)
        
        return sub_tree_str


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    node1 = TreeNode(1)
    node2 = TreeNode(2)
    node22 = TreeNode(2)
    node4 = TreeNode(4)
    node44 = TreeNode(4)
    node3 = TreeNode(3)
    node444 = TreeNode(4)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node3.left = node22
    node22.left = node44
    node3.right = node444
    
    solution = Solution()
    res = solution.findDuplicateSubtrees(node1)
    print(len(res))
