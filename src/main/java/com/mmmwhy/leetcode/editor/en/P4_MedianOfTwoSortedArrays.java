// Given two sorted arrays nums1 and nums2 of size m and n respectively, return t
// he median of the two sorted arrays.
//
// The overall run time complexity should be O(log (m+n)).
//
//
// Example 1:
//
//
// Input: nums1 = [1,3], nums2 = [2]
// Output: 2.00000
// Explanation: merged array = [1,2,3] and median is 2.
//
//
// Example 2:
//
//
// Input: nums1 = [1,2], nums2 = [3,4]
// Output: 2.50000
// Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
//
//
// Example 3:
//
//
// Input: nums1 = [0,0], nums2 = [0,0]
// Output: 0.00000
//
//
// Example 4:
//
//
// Input: nums1 = [], nums2 = [1]
// Output: 1.00000
//
//
// Example 5:
//
//
// Input: nums1 = [2], nums2 = []
// Output: 2.00000
//
//
//
// Constraints:
//
//
// nums1.length == m
// nums2.length == n
// 0 <= m <= 1000
// 0 <= n <= 1000
// 1 <= m + n <= 2000
// -106 <= nums1[i], nums2[i] <= 106
//
// Related Topics Array Binary Search Divide and Conquer
// 👍 13623 👎 1767

package com.mmmwhy.leetcode.editor.en;

public class P4_MedianOfTwoSortedArrays {
  // 题目困难的原因在于时间限制为 O(log (m+n)), 因此不能合并后找中间位置;

  public static void main(String[] args) {
    Solution solution = new P4_MedianOfTwoSortedArrays().new Solution();
    int[] nums1 = new int[] {1, 3};
    int[] nums2 = new int[] {2};
    System.out.println(solution.findMedianSortedArrays(nums1, nums2));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
      int n = nums1.length;
      int m = nums2.length;
      int left = (n + m + 1) / 2;
      int right = (n + m + 2) / 2;
      // 将偶数和奇数的情况合并，如果是奇数，会求两次同样的 k 。
      return (getKthMin(nums1, 0, n, nums2, 0, m, left)
              + getKthMin(nums1, 0, n, nums2, 0, m, right))
          * 0.5;
    }

    private int getKthMin(
        int[] nums1, int start1, int end1, int[] nums2, int start2, int end2, int k) {
      int len1 = end1 - start1;
      int len2 = end2 - start2;

      // 为了方便计算，我们使 nums1 的长度总小余 nums2
      if (len1 > len2) return getKthMin(nums2, start2, end2, nums1, start1, end1, k);
      if (len1 == 0) return nums2[start2 + k - 1];

      if (k == 1) return Math.min(nums1[start1], nums2[start2]);

      // 在每个数组内，找到 start + k/2 的位置
      int nums1_move_step = Math.min(len1, k / 2);
      int nums2_move_step = Math.min(len2, k / 2);

      int nums1_temp_mid = start1 + nums1_move_step;
      int nums2_temp_mid = start2 + nums2_move_step;

      if (nums1[nums1_temp_mid - 1] < nums2[nums2_temp_mid - 1]) {
        return getKthMin(nums1, nums1_temp_mid, end1, nums2, start2, end2, k - nums1_move_step);
      } else {
        return getKthMin(nums1, start1, end1, nums2, nums2_temp_mid, end2, k - nums2_move_step);
      }
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
