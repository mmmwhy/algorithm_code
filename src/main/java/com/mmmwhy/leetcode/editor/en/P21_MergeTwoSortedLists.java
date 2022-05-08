// You are given the heads of two sorted linked lists list1 and list2.
//
// Merge the two lists in a one sorted list. The list should be made by
// splicing together the nodes of the first two lists.
//
// Return the head of the merged linked list.
//
//
// Example 1:
//
//
// Input: list1 = [1,2,4], list2 = [1,3,4]
// Output: [1,1,2,3,4,4]
//
//
// Example 2:
//
//
// Input: list1 = [], list2 = []
// Output: []
//
//
// Example 3:
//
//
// Input: list1 = [], list2 = [0]
// Output: [0]
//
//
//
// Constraints:
//
//
// The number of nodes in both lists is in the range [0, 50].
// -100 <= Node.val <= 100
// Both list1 and list2 are sorted in non-decreasing order.
//
// Related Topics Linked List Recursion 👍 11344 👎 1020

package com.mmmwhy.leetcode.editor.en;

public class P21_MergeTwoSortedLists {
  public static void main(String[] args) {
    int[] nums1 = new int[] {};

    ListNode l1_start = new ListNode();
    ListNode l1_current = l1_start;
    for (int i : nums1) {
      ListNode temp_node = new ListNode(i);
      l1_current.next = temp_node;
      l1_current = temp_node;
    }

    int[] nums2 = new int[] {};

    ListNode l2_start = new ListNode();
    ListNode l2_current = l2_start;
    for (int i : nums2) {
      ListNode temp_node = new ListNode(i);
      l2_current.next = temp_node;
      l2_current = temp_node;
    }

    Solution solution = new P21_MergeTwoSortedLists().new Solution();
    ListNode result = solution.mergeTwoLists(l1_start.next, l2_start.next);
    while (result != null) {
      System.out.println(result.val);
      result = result.next;
    }
  }

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

  // leetcode submit region begin(Prohibit modification and deletion)

  /**
   * Definition for singly-linked list. public class ListNode { int val; ListNode next; ListNode()
   * {} ListNode(int val) { this.val = val; } ListNode(int val, ListNode next) { this.val = val;
   * this.next = next; } }
   */
  class Solution {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {

      ListNode current = new ListNode();
      ListNode result = new ListNode();
      result.next = current;

      while (list1 != null && list2 != null) {
        if (list1.val < list2.val) {
          current.next = list1;
          current = current.next;
          list1 = list1.next;
        } else {
          current.next = list2;
          current = current.next;
          list2 = list2.next;
        }
      }
      while (list1 != null) {
        current.next = list1;
        current = current.next;
        list1 = list1.next;
      }
      while (list2 != null) {
        current.next = list2;
        current = current.next;
        list2 = list2.next;
      }

      return result.next.next;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
