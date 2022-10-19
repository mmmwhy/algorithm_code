from typing import Optional


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


# leetcode submit region begin(Prohibit modification and deletion)
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        # 前边指针先走 n 步
        quick, slow = head, head
        for _ in range(n):
            quick = quick.next
        
        # 考虑 len(head) == n 的情况
        if quick is None:
            return head.next
        
        # slow 停在了需要删除点的前边
        while quick is not None and quick.next is not None:
            slow = slow.next
            quick = quick.next
        
        slow.next = slow.next.next
        return head


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    node1 = ListNode(1)
    node2 = ListNode(2)
    node3 = ListNode(3)
    node4 = ListNode(4)
    node5 = ListNode(5)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    
    solution = Solution()
    res = solution.removeNthFromEnd(node1, 5)
    
    while res is not None:
        print(res.val)
        res = res.next
