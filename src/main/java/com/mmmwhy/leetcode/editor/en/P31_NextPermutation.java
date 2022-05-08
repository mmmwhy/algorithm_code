// A permutation of an array of integers is an arrangement of its members into a
// sequence or linear order.
//
//
// For example, for arr = [1,2,3], the following are considered permutations of
// arr: [1,2,3], [1,3,2], [3,1,2], [2,3,1].
//
//
// The next permutation of an array of integers is the next lexicographically
// greater permutation of its integer. More formally, if all the permutations of the
// array are sorted in one container according to their lexicographical order,
// then the next permutation of that array is the permutation that follows it in the
// sorted container. If such arrangement is not possible, the array must be
// rearranged as the lowest possible order (i.e., sorted in ascending order).
//
//
// For example, the next permutation of arr = [1,2,3] is [1,3,2].
// Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
// While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does
// not have a lexicographical larger rearrangement.
//
//
// Given an array of integers nums, find the next permutation of nums.
//
// The replacement must be in place and use only constant extra memory.
//
//
// Example 1:
//
//
// Input: nums = [1,2,3]
// Output: [1,3,2]
//
//
// Example 2:
//
//
// Input: nums = [3,2,1]
// Output: [1,2,3]
//
//
// Example 3:
//
//
// Input: nums = [1,1,5]
// Output: [1,5,1]
//
//
//
// Constraints:
//
//
// 1 <= nums.length <= 100
// 0 <= nums[i] <= 100
//
// Related Topics Array Two Pointers 👍 10591 👎 3413

package com.mmmwhy.leetcode.editor.en;

import java.util.Arrays;

public class P31_NextPermutation {
  public static void main(String[] args) {
    Solution solution = new P31_NextPermutation().new Solution();
    // 1,3,2
    int[] nums = {1, 2, 3};
    solution.nextPermutation(nums);
    System.out.println(Arrays.toString(nums));

    // 1,2,3
    int[] nums1 = {3, 2, 1};
    solution.nextPermutation(nums1);
    System.out.println(Arrays.toString(nums1));

    // 1,5,1
    int[] nums2 = {1, 1, 5};
    solution.nextPermutation(nums2);
    System.out.println(Arrays.toString(nums2));

    // 3,1,2
    int[] nums3 = {2, 3, 1};
    solution.nextPermutation(nums3);
    System.out.println(Arrays.toString(nums3));

    // 2,1,3
    int[] nums4 = {1, 3, 2};
    solution.nextPermutation(nums4);
    System.out.println(Arrays.toString(nums4));

    // 5,5,2,3,4,7
    int[] nums5 = {5, 4, 7, 5, 3, 2};
    solution.nextPermutation(nums5);
    System.out.println(Arrays.toString(nums5));

    // 4,2,0,3,0,2,2
    int[] nums6 = {4, 2, 0, 2, 3, 2, 0};
    solution.nextPermutation(nums6);
    System.out.println(Arrays.toString(nums6));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public void nextPermutation(int[] nums) {
      // 从后向前，找到满足： k > k - n 的位置
      int left = nums.length - 1, right = nums.length - 1;
      // flag 是哪个元素小于当前元素，left 是当前元素的位置
      int flag = -1;
      int final_left = right;
      while (left > 0) {
        // 找出第一个大于 left 位置的元素
        // 不是第一个了，是最小的那个 flag
        for (int i = left - 1; i >= 0; i--) {
          if (nums[i] < nums[left]) {
            if (i > flag) {
              flag = i;
              final_left = left;
              break;
            }
          }
        }
        left--;
      }

      // 从 left 到 right 之间的元素开始向前自动
      if (flag == -1) {
        reverse(nums);
      } else {
        // 将 left 插入到 flag 前边去
        for (int j = final_left; j > flag; j--) {
          int temp = nums[j];
          nums[j] = nums[j - 1];
          nums[j - 1] = temp;
        }
        // flag 位置后的元素全部原地排序
        // 从 flag + 1 到 right 之间的元素
        // 写一个冒泡排序
        for (int k = right; k > flag; k--) {
          for (int l = k - 1; l > flag; l--) {
            if (nums[l] > nums[k]) {
              int temp = nums[l];
              nums[l] = nums[k];
              nums[k] = temp;
            }
          }
        }
      }
    }

    public void reverse(int[] nums) {
      for (int i = 0; i < nums.length / 2; i++) {
        int temp = nums[i];
        nums[i] = nums[nums.length - i - 1];
        nums[nums.length - i - 1] = temp;
      }
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
