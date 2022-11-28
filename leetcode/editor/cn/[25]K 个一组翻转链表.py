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
    def reverseBetween(self, head: Optional[ListNode], left: int, right: int):
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
    
    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        # 统计一下长度
        n = 0
        temp_node = head
        while temp_node:
            n += 1
            temp_node = temp_node.next
        
        for start_pos in range(1, n, k):
            if start_pos + k - 1 <= n:
                head = self.reverseBetween(head, start_pos, start_pos + k - 1)
            continue
        
        return head


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    for j in range(1, 6):
        node_list = []
        for i in range(1, 6):
            node_list.append(ListNode(i))
        for i in range(4):
            node_list[i].next = node_list[i + 1]
        
        res = solution.reverseKGroup(node_list[0], j)
        
        print(f"#### {j}")
        while res:
            print(res.val)
            res = res.next
