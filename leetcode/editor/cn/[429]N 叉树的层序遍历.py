from typing import List

# leetcode submit region begin(Prohibit modification and deletion)
"""
# Definition for a Node.
class Node:
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children
"""


# 广度优先
class Solution:
    def levelOrder(self, root: 'Node') -> List[List[int]]:
        if not root:
            return []
        queue = [(root, 0)]
        res = []
        while queue:
            node, deep = queue.pop(0)
            if len(res) > deep:
                res[deep].append(node.val)
            else:
                res.append([node.val])
            for n in node.children:
                queue.append((n, deep + 1))
        return res

# leetcode submit region end(Prohibit modification and deletion)
