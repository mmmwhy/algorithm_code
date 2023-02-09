import math
from typing import List, Optional


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
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        dummy = ListNode()
        last = dummy
        while True:
            min_value = math.inf
            min_index = -1
            for index, node in enumerate(lists):
                if not node:
                    continue
                # 找出最小的 node
                if node.val < min_value:
                    min_value = node.val
                    min_index = index
            
            if min_value == math.inf:
                break
            
            # 合并结果，并移动位置
            temp_node = ListNode(min_value)
            last.next = temp_node
            last = temp_node
            
            lists[min_index] = lists[min_index].next
        
        return dummy.next


# leetcode submit region end(Prohibit modification and deletion)


def generate_list_node(nums):
    last = ListNode()
    dummy = last
    
    for num in nums:
        cur = ListNode(val=num)
        last.next = cur
        last = cur
    return dummy.next


if __name__ == "__main__":
    solution = Solution()
    res = solution.mergeKLists([
        generate_list_node([1, 4, 5]),
        generate_list_node([1, 3, 4]),
        generate_list_node([2, 6])
    ])
    
    while res:
        print(res.val)
        res = res.next
