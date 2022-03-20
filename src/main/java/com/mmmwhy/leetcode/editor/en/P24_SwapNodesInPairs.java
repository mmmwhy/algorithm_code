// Given a linked list, swap every two adjacent nodes and return its head. You
// must solve the problem without modifying the values in the list's nodes (i.e.,
// only nodes themselves may be changed.)
//
//
// Example 1:
//
//
// Input: head = [1,2,3,4]
// Output: [2,1,4,3]
//
//
// Example 2:
//
//
// Input: head = []
// Output: []
//
//
// Example 3:
//
//
// Input: head = [1]
// Output: [1]
//
//
//
// Constraints:
//
//
// The number of nodes in the list is in the range [0, 100].
// 0 <= Node.val <= 100
//
// Related Topics Linked List Recursion 👍 6569 👎 283

package com.mmmwhy.leetcode.editor.en;

public class P24_SwapNodesInPairs {
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
    int[] nums = new int[] {1};
    ListNode l1Start = new ListNode();
    ListNode l1Current = l1Start;
    for (int i : nums) {
      l1Current.next = new ListNode(i);
      l1Current = l1Current.next;
    }

    Solution solution = new P24_SwapNodesInPairs().new Solution();
    ListNode result = solution.swapPairs(l1Start.next);
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
    public ListNode swapPairs(ListNode head) {
      ListNode result = new ListNode(0, head);

      // 初始化,顺便处理边界条件
      ListNode i = result, j = result, k = result;

      j = i.next;
      if (j == null) {
        // head 为空
        return result.next;
      }
      k = j.next;
      if (k == null) {
        // head 只有一个节点
        return result.next;
      }

      while (true) {
        i.next = k;
        j.next = k.next;
        k.next = j;

        i = i.next.next;
        j = i.next;
        if (j == null) {
          break;
        }
        k = j.next;
        if (k == null) {
          break;
        }
      }
      return result.next;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
