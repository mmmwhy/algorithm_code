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
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int) -> Optional[ListNode]:
        res_node = ListNode(-1)
        res_node.next = head
        
        pre = res_node
        cur = head
        next = head.next
        
        for _ in range(left - 1):
            pre = pre.next
            cur = cur.next
            next = next.next
        
        for i in range(right - left):
            cur.next = next.next
            next.next = pre.next
            pre.next = next
            if cur.next:
                next = cur.next
        
        return res_node.next


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    node_list = []
    for i in range(1, 6):
        node_list.append(ListNode(i))
    for i in range(4):
        node_list[i].next = node_list[i + 1]
    
    res = solution.reverseBetween(ListNode(5), 1, 1)
    
    while res:
        print(res.val)
        res = res.next
