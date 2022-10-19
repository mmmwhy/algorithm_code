from typing import Optional


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


# leetcode submit region begin(Prohibit modification and deletion)
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        # 边缘条件，没有节点或者单个节点的时候
        if head is None or head.next is None:
            return False

        # 构造快慢指针
        quick = head
        slow = head

        while quick is not None:
            slow = slow.next

            # 走到头了，肯定不是环
            if quick.next is None:
                return False
            else:
                quick = quick.next.next

            # 遇到环了
            if slow == quick:
                return True


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    # 构造一个有环的 list
    node1 = ListNode(1)
    node2 = ListNode(2)
    node3 = ListNode(3)

    node1.next = node2
    node2.next = node1
    node3.next = node1

    solution = Solution()
    print(solution.hasCycle(node1))
