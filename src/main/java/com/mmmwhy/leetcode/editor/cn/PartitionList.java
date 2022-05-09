/**
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。

 你应当 保留 两个分区中每个节点的初始相对位置。 



 示例 1： 


 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]


 示例 2： 


 输入：head = [2,1], x = 2
 输出：[1,2]




 提示： 


 链表中节点的数目在范围 [0, 200] 内 
 -100 <= Node.val <= 100 
 -200 <= x <= 200 


 Related Topics 链表 双指针 👍 630 👎 0

 */

package com.mmmwhy.leetcode.editor.cn;


public class PartitionList{

    public static void main(String[] args) {
        Solution solution = new PartitionList().new Solution();

        int[] nums1 = new int[] {1, 4, 5};

        ListNode l1Start = new ListNode();
        ListNode l1Current = l1Start;
        for (int i : nums1) {
            ListNode tempNode = new ListNode(i);
            l1Current.next = tempNode;
            l1Current = tempNode;
        }


        ListNode result = solution.partition(l1Start.next,1);
        while (result != null) {
            System.out.println(result.val);
            result = result.next;
        }
    }
    public static class ListNode {
        int val;
        ListNode next;
        ListNode() {}
        ListNode(int val) { this.val = val; }
        ListNode(int val, ListNode next) { this.val = val; this.next = next; }
    }
    //leetcode submit region begin(Prohibit modification and deletion)
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     int val;
     *     ListNode next;
     *     ListNode() {}
     *     ListNode(int val) { this.val = val; }
     *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
     * }
     */
    class Solution {
        public ListNode partition(ListNode head, int x) {
            // 构造一个虚拟的头，避免越界
            ListNode dummy = new ListNode(-1);
            dummy.next = head;

            ListNode left = dummy;

            // 先找到第一个大于等于 x 节点的左边节点
            while(left.next != null){
                if(left.next.val >= x){
                    // 找到了
                    break;
                }
                left = left.next;
            }

            // 边界情况, 所有结果都小于 x，直接返回。 或最后一位大于等于 x 。
            if(left.next == null ){
                return dummy.next;
            }

            // 从 left 的下一个位置出发，找到所有 小于 x 节点的左边节点
            ListNode right = left.next;
            while(right.next != null){
                if(right.next.val < x){
                    // 开始给 point 换位置
                    ListNode point = right.next;
                    right.next = point.next;

                    // 换到 left 的左边
                    point.next = left.next;
                    left.next = point;
                    left = point; // 保证位置不变
                }
                // 否则继续处理后边的数字
                if(right.next != null &&right.next.val >= x){
                    right = right.next;
                }
            }

            return dummy.next;


        }
    }

//leetcode submit region end(Prohibit modification and deletion)

}