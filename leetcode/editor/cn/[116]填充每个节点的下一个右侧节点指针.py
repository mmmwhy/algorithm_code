from typing import Optional


class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next


# leetcode submit region begin(Prohibit modification and deletion)
"""
# Definition for a Node.
class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next
"""


class Solution:
    def connect(self, root: 'Optional[Node]') -> 'Optional[Node]':
        self.traverse(root)
        return root
    
    def traverse(self, cur_node):
        # 遍历完成节点
        if cur_node is None:
            return
        
        if cur_node.left is not None:
            # 完美二叉树，两边都有
            cur_node.left.next = cur_node.right
        
        if cur_node.right is not None and cur_node.next is not None:
            # 不是第一个节点即可
            cur_node.right.next = cur_node.next.left
        
        self.traverse(cur_node.left)
        self.traverse(cur_node.right)


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    # 根据层序遍历结构，构造树
    nums = [1, 2, 3, 4, 5, 6, 7]
    node_list = [Node(i) for i in nums]
    node_list[0].left = node_list[1]
    node_list[0].right = node_list[2]
    
    node_list[1].left = node_list[3]
    node_list[1].right = node_list[4]
    
    node_list[2].left = node_list[5]
    node_list[2].right = node_list[6]
    
    solution = Solution()
    res = solution.connect(node_list[0])
    print(res)
