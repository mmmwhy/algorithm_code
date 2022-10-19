# leetcode submit region begin(Prohibit modification and deletion)
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # 边缘情况
        if head is None or head.next is None:
            return head
        
        """
        构造3个指针， pre,cur,next, pre 为一个空表头
        head -> 1 -> 2 -> 3 -> 4
        head -> 2 -> 1 -> 3 -> 4
        head -> 3 -> 2 -> 1 -> 4
        head -> 4 -> 3 -> 2 -> 1
        """
        pre = ListNode()
        pre.next = head  # head
        cur = head  # 1
        next: Optional[ListNode] = head.next  # 2
        
        while cur.next is not None:
            cur.next = next.next
            next.next = pre.next
            pre.next = next
            
            next = cur.next
        return pre.next


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    begin = ListNode()
    temp = begin
    for i in [1, 2, 3, 4, 5]:
        cur = ListNode(i)
        temp.next = cur
        temp = temp.next
    
    res = solution.reverseList(begin.next)
    while res is not None:
        print(res.val)
        res = res.next
