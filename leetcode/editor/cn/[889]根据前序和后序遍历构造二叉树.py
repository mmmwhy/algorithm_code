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
    def constructFromPrePost(self, preorder: List[int], postorder: List[int]) -> Optional[TreeNode]:
        if len(preorder) == 0:
            return None
        
        if len(preorder) == 1:
            return TreeNode(preorder[0])
        
        root_node = TreeNode(preorder[0])
        
        # 尝试找左子树
        left_node_count = 0
        
        # 最右边的位置已被占用
        for temp_left_node_count in range(1, len(preorder)):
            flag = 1
            for pre_value in preorder[1:1 + temp_left_node_count]:
                if pre_value not in postorder[:temp_left_node_count]:
                    flag = 0
            
            if flag == 1:
                left_node_count = temp_left_node_count
                break
        
        root_node.left = self.constructFromPrePost(
                preorder[1:1 + left_node_count],
                postorder[:left_node_count]
        )
        
        root_node.right = self.constructFromPrePost(
                preorder[1 + left_node_count:],
                postorder[left_node_count:-1]
        )
        
        return root_node


# leetcode submit region end(Prohibit modification and deletion)

def print_inorder(node: TreeNode):
    if node is None:
        return
    
    print(node.val)
    print_inorder(node.left)
    print_inorder(node.right)


def print_postorder(node: TreeNode):
    if node is None:
        return
    
    print_postorder(node.left)
    print_postorder(node.right)
    print(node.val)


if __name__ == "__main__":
    preorder = [1]
    postorder = [1]
    
    solution = Solution()
    res = solution.constructFromPrePost(preorder, postorder)
    print(res.val)
    
    print_inorder(res)
    print("-------")
    print_postorder(res)
