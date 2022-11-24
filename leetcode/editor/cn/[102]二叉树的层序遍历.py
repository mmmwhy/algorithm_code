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
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []
        
        queue = []
        res = []
        
        queue.append([root, 0])
        
        while len(queue) > 0:
            cur, depth = queue.pop(0)
            if cur.left is not None:
                queue.append([cur.left, depth + 1])
            if cur.right is not None:
                queue.append([cur.right, depth + 1])
            
            # depth 为 0 的时候，res 需要有 1 个长度了
            if len(res) == depth:
                res.append([cur.val])
            else:
                res[depth].append(cur.val)
        
        return res


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    node3 = TreeNode(3)
    node9 = TreeNode(9)
    node20 = TreeNode(20)
    node15 = TreeNode(15)
    node7 = TreeNode(7)
    node1 = TreeNode(1)
    node2 = TreeNode(2)
    
    node3.left = node9
    node9.left = node1
    node9.right = node2
    
    node3.right = node20
    node20.left = node15
    node20.right = node7
    
    solution = Solution()
    print(solution.levelOrder(node3))
