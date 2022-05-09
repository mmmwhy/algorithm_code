/**
将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

 

 示例 1： 
 

输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]
 

 示例 2： 

 
输入：l1 = [], l2 = []
输出：[]
 

 示例 3： 

 
输入：l1 = [], l2 = [0]
输出：[0]
 

 

 提示： 

 
 两个链表的节点数目范围是 [0, 50] 
 -100 <= Node.val <= 100 
 l1 和 l2 均按 非递减顺序 排列 
 

 Related Topics 递归 链表 👍 2729 👎 0

*/

package com.mmmwhy.leetcode.editor.cn;
public class MergeTwoSortedLists{
  public static void main(String[] args) {
      int[] nums1 = new int[] {1, 4, 5};

      ListNode l1Start = new ListNode();
      ListNode l1Current = l1Start;
      for (int i : nums1) {
          ListNode tempNode = new ListNode(i);
          l1Current.next = tempNode;
          l1Current = tempNode;
      }


      ListNode l2Start = new ListNode();
      ListNode l2Current = l2Start;
      for (int i : nums1) {
          ListNode tempNode = new ListNode(i);
          l2Current.next = tempNode;
          l2Current = tempNode;
      }



      Solution solution = new MergeTwoSortedLists().new Solution();
      solution.mergeTwoLists(l1Start,l2Start);

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
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        // 构造一个虚拟的表头
        ListNode head  = new ListNode(-1);
        ListNode p = head;

        ListNode p1 = list1,p2 = list2;
        while(p1 != null && p2 != null){
            if(p1.val < p2.val){
                p.next = p1;
                p1 = p1.next;
            }else{
                p.next = p2;
                p2 = p2.next;
            }
            p = p.next;
        }

        // 直接链接到后边
        if(p1 != null){
            p.next = p1;
        }

        if(p2 != null){
            p.next = p2;
        }

        return head.next;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}