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


class SolutionHalf:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        
        node_count = 0
        cur_node = head
        
        while cur_node is not None:
            cur_node = cur_node.next
            node_count += 1
        # 边界条件
        if node_count <= 1:
            return True
        
        node_list = []
        cur_node = head
        
        cur_node_count = node_count
        while cur_node_count > node_count / 2:
            node_list.append(cur_node.val)
            cur_node = cur_node.next
            cur_node_count -= 1
        # cur_node_count 此时到了后半段，挨个与 node_list 结果对比就可以了
        
        while cur_node_count > 0:
            if cur_node.val == node_list[cur_node_count - 1]:
                cur_node = cur_node.next
                cur_node_count -= 1
            else:
                return False
        return True


class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        import copy
        # 实现一个链表反转的实现
        reversed_head = self.reverse(copy.deepcopy(head))
        while reversed_head:
            if head.val != reversed_head.val:
                return False
            head = head.next
            reversed_head = reversed_head.next
        
        return True
    
    def reverse(self, head):
        pre = ListNode(-1)
        pre.next = head
        cur = head
        next = head.next
        
        while next is not None:
            # 挪的其实一直是 next，所以需要判断 next 是否存在
            cur.next = next.next
            next.next = pre.next  # 不可以是 cur，因为 cur 现在不一定在 pre 的后边
            pre.next = next
            
            next = cur.next
        return pre.next


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    
    root_node = ListNode(-1)
    temp = root_node
    for i in [1, 2, 3, 4]:
        temp.next = ListNode(i)
        temp = temp.next
    
    solution = Solution()
    print(solution.isPalindrome(root_node.next))
    
    root_node = ListNode(-1)
    temp = root_node
    for i in [1, 0, 1]:
        temp.next = ListNode(i)
        temp = temp.next
    
    solution = Solution()
    print(solution.isPalindrome(root_node.next))
    
    root_node = ListNode(-1)
    temp = root_node
    for i in [1]:
        temp.next = ListNode(i)
        temp = temp.next
    
    solution = Solution()
    print(solution.isPalindrome(root_node.next))
    
    root_node = ListNode(-1)
    temp = root_node
    for i in [1, 2]:
        temp.next = ListNode(i)
        temp = temp.next
    
    solution = Solution()
    print(solution.isPalindrome(root_node.next))
