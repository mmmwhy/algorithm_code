from typing import List, Optional


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


# leetcode submit region begin(Prohibit modification and deletion)
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Codec:
    
    def serialize(self, root):
        """Encodes a tree to a single string.
        
        :type root: TreeNode
        :rtype: str
        """
        res = []
        self.pre_order(root, res)
        return ",".join(res)
    
    def pre_order(self, root, res):
        if not root:
            res.append("null")
            return
        
        res.append(str(root.val))
        self.pre_order(root.left, res)
        self.pre_order(root.right, res)
    
    def bfs(self, res: List) -> Optional[TreeNode]:
        val = res.pop(0)
        if val == 'null':
            return None
        root = TreeNode(val)
        root.left = self.bfs(res)
        root.right = self.bfs(res)
        
        return root
    
    def deserialize(self, data):
        """Decodes your encoded data to tree.
        
        :type data: str
        :rtype: TreeNode
        """
        print(data)
        return self.bfs(data.split(','))


# Your Codec object will be instantiated and called as such:
# ser = Codec()
# deser = Codec()
# ans = deser.deserialize(ser.serialize(root))
# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    node1 = TreeNode(1)
    node2 = TreeNode(2)
    node3 = TreeNode(3)
    node4 = TreeNode(4)
    node5 = TreeNode(5)
    
    node1.left = node2
    node1.right = node3
    node3.left = node4
    node3.right = node5
    
    ser = Codec()
    deser = Codec()
    
    ans = deser.deserialize(ser.serialize(node1))
    
    print(ans.val)
    
    node1 = TreeNode(3)
    node2 = TreeNode(2)
    node3 = TreeNode(4)
    node4 = TreeNode(3)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    
    ser = Codec()
    deser = Codec()
    
    ans = deser.deserialize(ser.serialize(node1))
    
    print(ans.val)
