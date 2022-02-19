//You are given two non-empty linked lists representing two non-negative integer
//s. The digits are stored in reverse order, and each of their nodes contains a si
//ngle digit. Add the two numbers and return the sum as a linked list. 
//
// You may assume the two numbers do not contain any leading zero, except the nu
//mber 0 itself. 
//
// 
// Example 1: 
//
// 
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.
// 
//
// Example 2: 
//
// 
//Input: l1 = [0], l2 = [0]
//Output: [0]
// 
//
// Example 3: 
//
// 
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]
// 
//
// 
// Constraints: 
//
// 
// The number of nodes in each linked list is in the range [1, 100]. 
// 0 <= Node.val <= 9 
// It is guaranteed that the list represents a number that does not have leading
// zeros. 
// 
// Related Topics Linked List Math Recursion 
// 👍 15033 👎 3282

package com.mmmwhy.leetcode.editor.en;


public class P2_AddTwoNumbers {
    public static void main(String[] args) {
        Solution solution = new P2_AddTwoNumbers().new Solution();

        int[] l1_data = new int[]{9,9,9,9,9,9,9};
        int[] l2_data = new int[]{9,9,9,9};

        ListNode l1_start = new ListNode();
        ListNode l1_current = l1_start;

        ListNode l2_start = new ListNode();
        ListNode l2_current = l2_start;

        for (int num : l1_data) {
            ListNode temp_node = new ListNode(num);
            l1_current.next = temp_node;
            l1_current = temp_node;
        }

        for (int num : l2_data) {
            ListNode temp_node = new ListNode(num);
            l2_current.next = temp_node;
            l2_current = temp_node;
        }

        ListNode result = solution.addTwoNumbers(l1_start.next, l2_start.next);
        while (result != null) {
            System.out.println(result.val);
            result = result.next;
        }
    }

    public static class ListNode {
        int val;
        ListNode next;

        ListNode() {
        }

        ListNode(int val) {
            this.val = val;
        }

        ListNode(int val, ListNode next) {
            this.val = val;
            this.next = next;
        }
    }

//leetcode submit region begin(Prohibit modification and deletion)

    /**
     * Definition for singly-linked list.
     * public class ListNode {
     * int val;
     * ListNode next;
     * ListNode() {}
     * ListNode(int val) { this.val = val; }
     * ListNode(int val, ListNode next) { this.val = val; this.next = next; }
     * }
     */
    class Solution {
        public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
            // 用于保存进位
            int flag = 0;
            ListNode start_of_node = new ListNode();
            ListNode current_node = start_of_node;
            while (l1 != null || l2 != null) {
                int value = flag;
                // 注入到 value 后，flag 需要根据计算结束的 value 来确定新的值
                flag = 0;
                if (l1 != null) {
                    value += l1.val;
                    l1 = l1.next;
                }
                if (l2 != null) {
                    value += l2.val;
                    l2 = l2.next;
                }
                if (value > 9) {
                    flag = 1;
                    value = value % 10;
                }
                ListNode temp_node = new ListNode(value);
                current_node.next = temp_node;
                current_node = temp_node;

            }

            if (flag != 0) {
                current_node.next = new ListNode(flag);
            }

            return start_of_node.next;
        }
    }
//leetcode submit region end(Prohibit modification and deletion)

}