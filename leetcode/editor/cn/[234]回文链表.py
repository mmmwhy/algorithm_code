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


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    root_node = ListNode(-1)
    temp = root_node
    for i in [1]:
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
    for i in [1, 2, 2, 1]:
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
