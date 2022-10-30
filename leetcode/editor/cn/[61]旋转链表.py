from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


# leetcode submit region begin(Prohibit modification and deletion)
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        # 长度为 0，1 的边界情况
        if head is None or head.next is None:
            return head
        
        root_node = ListNode(-1)
        root_node.next = head
        
        # right 走到最后一个节点的位置
        right = root_node
        node_count = 0
        while right.next is not None:
            node_count += 1
            right = right.next
        
        # 避免 k 超过 head 的长度
        k = k % node_count
        
        # 从开始的位置，走上 node_count - k 步
        left_node = root_node
        walk_count = node_count - k
        
        # left_node.next 是要开始换的位置
        while walk_count > 0:
            left_node = left_node.next
            walk_count -= 1
        
        # 开始进行交换操作
        right.next = root_node.next
        root_node.next = left_node.next
        left_node.next = None
        
        return root_node.next


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    root = ListNode(-1)
    cur_node = root
    
    for i in [0, 1, 2]:
        new_node = ListNode(i)
        cur_node.next = new_node
        cur_node = cur_node.next
    
    res = solution.rotateRight(root.next, 99999999)
    while res is not None:
        print(res.val)
        res = res.next
