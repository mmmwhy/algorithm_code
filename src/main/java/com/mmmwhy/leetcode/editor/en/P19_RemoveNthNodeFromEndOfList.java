// Given the head of a linked list, remove the nᵗʰ node from the end of the list
// and return its head.
//
//
// Example 1:
//
//
// Input: head = [1,2,3,4,5], n = 2
// Output: [1,2,3,5]
//
//
// Example 2:
//
//
// Input: head = [1], n = 1
// Output: []
//
//
// Example 3:
//
//
// Input: head = [1,2], n = 1
// Output: [1]
//
//
//
// Constraints:
//
//
// The number of nodes in the list is sz.
// 1 <= sz <= 30
// 0 <= Node.val <= 100
// 1 <= n <= sz
//
//
//
// Follow up: Could you do this in one pass?
// Related Topics Linked List Two Pointers 👍 9105 👎 431

package com.mmmwhy.leetcode.editor.en;

public class P19_RemoveNthNodeFromEndOfList {
  public static class ListNode {
    int val;
    ListNode next;

    ListNode() {}

    ListNode(int val) {
      this.val = val;
    }

    ListNode(int val, ListNode next) {
      this.val = val;
      this.next = next;
    }
  }

  public static void main(String[] args) {
    Solution solution = new P19_RemoveNthNodeFromEndOfList().new Solution();
    int[] nums = new int[] {1};

    ListNode l1_start = new ListNode();
    ListNode l1_current = l1_start;
    for (int i : nums) {
      ListNode temp_node = new ListNode(i);
      l1_current.next = temp_node;
      l1_current = temp_node;
    }
    ListNode result = solution.removeNthFromEnd(l1_start.next, 1);
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
    public ListNode removeNthFromEnd(ListNode head, int n) {
      // 边界条件 head 为空时
      if (head == null) {
        return null;
      }
      // 让快结点先走 n 步
      ListNode quick_node = head;

      // 慢结点在快结点走了 n 步后，跟着继续走
      ListNode slow_node = head;

      // 先让快的先走
      while (quick_node != null && n > 0) {
        quick_node = quick_node.next;
        n--;
      }
      // 如果 quick 已经是 null 了， 说明 n >= sz (node 的长度)， 而给过限制条件，说明 n <= sz
      // 则此时边界条件 n = sz 了
      if (quick_node == null) {
        return head.next;
      }

      while (quick_node.next != null) {
        quick_node = quick_node.next;
        slow_node = slow_node.next;
      }
      // 对位置开始调整
      slow_node.next = slow_node.next.next;

      return head;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
