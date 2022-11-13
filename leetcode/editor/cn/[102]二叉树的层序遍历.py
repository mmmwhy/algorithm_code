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
        
        queue.append(root)
        
        while len(queue) > 0:
            temp_res = []
            queue_length = len(queue)
            # 注意这里的双层循环设计，这样可以将同一层结果使用 temp_res 记录
            for i in range(queue_length):
                cur = queue.pop(0)
                if cur.left is not None:
                    queue.append(cur.left)
                if cur.right is not None:
                    queue.append(cur.right)
                temp_res.append(cur.val)
            
            res.append(temp_res)
        
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
