// Given the head of a linked list, reverse the nodes of the list k at a time,
// and return the modified list.
//
// k is a positive integer and is less than or equal to the length of the
// linked list. If the number of nodes is not a multiple of k then left-out nodes, in
// the end, should remain as it is.
//
// You may not alter the values in the list's nodes, only nodes themselves may
// be changed.
//
//
// Example 1:
//
//
// Input: head = [1,2,3,4,5], k = 2
// Output: [2,1,4,3,5]
//
//
// Example 2:
//
//
// Input: head = [1,2,3,4,5], k = 3
// Output: [3,2,1,4,5]
//
//
//
// Constraints:
//
//
// The number of nodes in the list is n.
// 1 <= k <= n <= 5000
// 0 <= Node.val <= 1000
//
//
//
// Follow-up: Can you solve the problem in O(1) extra memory space?
// Related Topics Linked List Recursion 👍 6595 👎 476

package com.mmmwhy.leetcode.editor.en;

import java.util.Stack;

public class P25_ReverseNodesInKGroup {
  public static class ListNode {
    int val;
    ListNode next;

    ListNode() {}
    ;

    ListNode(int val) {
      this.val = val;
    }

    ListNode(int val, ListNode next) {
      this.val = val;
      this.next = next;
    }
  }

  public static void main(String[] args) {
    int[] nums = new int[] {1, 2};
    ListNode l1Start = new ListNode();
    ListNode l1Current = l1Start;
    for (int i : nums) {
      l1Current.next = new ListNode(i);
      l1Current = l1Current.next;
    }
    Solution solution = new P25_ReverseNodesInKGroup().new Solution();
    ListNode result = solution.reverseKGroup(l1Start.next, 2);
    while (result != null) {
      System.out.println(result.val);
      result = result.next;
    }
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  /**
   * Definition for singly-linked list. public class ListNode { int val; ListNode next; ListNode()
   * {} ListNode(int val) { this.val = val; } ListNode(int val, ListNode next) { this.val = val;
   * this.next = next; } }
   */
  class Solution {
    public ListNode reverseKGroup(ListNode head, int k) {
      ListNode result = new ListNode(0, head);
      ListNode current = result;
      Stack<ListNode> stack = new Stack<>();
      while (head != null) {
        // 将 list 放入栈中
        for (int i = 0; i < k; i++) {
          stack.push(head);
          head = head.next;
          if (head == null && i < k - 1) {
            // 发现长度不够 k 了，把 stack 清理到 stackReverse 去
            Stack<ListNode> stackReverse = new Stack<>();
            while (!stack.isEmpty()) {
              stackReverse.push(stack.pop());
            }
            while (!stackReverse.isEmpty()) {
              current.next = stackReverse.pop();
              current = current.next;
            }
            break;
          }
        }
        // 然后将 stack 的结果依次取出，从而完成一次循环
        while (!stack.isEmpty()) {
          current.next = stack.pop();
          current = current.next;
        }
      }

      // 最后一个位置
      current.next = null;

      return result.next;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
