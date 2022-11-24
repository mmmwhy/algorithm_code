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
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        root = ListNode(-1)
        cur = root
        
        extra_value = 0
        while l1 and l2:
            temp_value = l1.val + l2.val + extra_value
            cur.next = ListNode(temp_value % 10)
            cur = cur.next
            
            extra_value = temp_value // 10
            
            l1 = l1.next
            l2 = l2.next
        
        while l1:
            temp_value = l1.val + extra_value
            cur.next = ListNode(temp_value % 10)
            cur = cur.next
            
            extra_value = temp_value // 10
            
            l1 = l1.next
        
        while l2:
            temp_value = l2.val + extra_value
            cur.next = ListNode(temp_value % 10)
            cur = cur.next
            
            extra_value = temp_value // 10
            
            l2 = l2.next
        
        if extra_value > 0:
            cur.next = ListNode(extra_value)
        
        return root.next


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    solution.addTwoNumbers()
