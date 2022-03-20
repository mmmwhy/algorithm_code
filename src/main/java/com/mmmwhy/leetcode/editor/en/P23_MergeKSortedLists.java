// You are given an array of k linked-lists lists, each linked-list is sorted in
// ascending order.
//
// Merge all the linked-lists into one sorted linked-list and return it.
//
//
// Example 1:
//
//
// Input: lists = [[1,4,5],[1,3,4],[2,6]]
// Output: [1,1,2,3,4,4,5,6]
// Explanation: The linked-lists are:
// [
//  1->4->5,
//  1->3->4,
//  2->6
// ]
// merging them into one sorted list:
// 1->1->2->3->4->4->5->6
//
//
// Example 2:
//
//
// Input: lists = []
// Output: []
//
//
// Example 3:
//
//
// Input: lists = [[]]
// Output: []
//
//
//
// Constraints:
//
//
// k == lists.length
// 0 <= k <= 10⁴
// 0 <= lists[i].length <= 500
// -10⁴ <= lists[i][j] <= 10⁴
// lists[i] is sorted in ascending order.
// The sum of lists[i].length will not exceed 10⁴.
//
// Related Topics Linked List Divide and Conquer Heap (Priority Queue) Merge
// Sort 👍 11526 👎 457

package com.mmmwhy.leetcode.editor.en;

public class P23_MergeKSortedLists {

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
    int[] nums1 = new int[] {1, 4, 5};

    ListNode l1Start = new ListNode();
    ListNode l1Current = l1Start;
    for (int i : nums1) {
      ListNode tempNode = new ListNode(i);
      l1Current.next = tempNode;
      l1Current = tempNode;
    }

    int[] nums2 = new int[] {1, 3, 4};
    ListNode l2Start = new ListNode();
    ListNode l2Current = l2Start;
    for (int i : nums2) {
      ListNode tempNode = new ListNode(i);
      l2Current.next = tempNode;
      l2Current = tempNode;
    }

    int[] nums3 = new int[] {2, 6};
    ListNode l3Start = new ListNode();
    ListNode l3Current = l3Start;
    for (int i : nums3) {
      ListNode tempNode = new ListNode(i);
      l3Current.next = tempNode;
      l3Current = tempNode;
    }

    Solution solution = new P23_MergeKSortedLists().new Solution();
    ListNode result = solution.mergeKLists(new ListNode[] {l1Start.next, l2Start.next});
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
    public ListNode mergeKLists(ListNode[] lists) {
      ListNode result = new ListNode();
      ListNode resultCurrent = result;
      // 只有当所有 ListNode 都为空的时候才可以 break
      while (true) {
        // 是否全都是 null
        boolean flagNotAllNull = false;
        ListNode smallestNode = new ListNode(Integer.MAX_VALUE);
        for (ListNode tempNode : lists) {
          if (tempNode != null) {
            flagNotAllNull = true;
            if (tempNode.val < smallestNode.val) {
              smallestNode = tempNode;
            }
          }
        }
        // 全为空的时候，就不需要往后走了
        if (!flagNotAllNull) break;

        // 找到了最小的 node
        resultCurrent.next = new ListNode(smallestNode.val);
        resultCurrent = resultCurrent.next;

        // 最小 node 所在的 listNode 需要向前一步；
        for (int i = 0; i < lists.length; i++) {
          if (lists[i] == smallestNode) {
            lists[i] = lists[i].next;
          }
        }
      }

      return result.next;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
