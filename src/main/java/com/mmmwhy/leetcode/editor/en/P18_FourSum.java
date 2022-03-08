// Given an array nums of n integers, return an array of all the unique
// quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
//
//
// 0 <= a, b, c, d < n
// a, b, c, and d are distinct.
// nums[a] + nums[b] + nums[c] + nums[d] == target
//
//
// You may return the answer in any order.
//
//
// Example 1:
//
//
// Input: nums = [1,0,-1,0,-2,2], target = 0
// Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
//
//
// Example 2:
//
//
// Input: nums = [2,2,2,2,2], target = 8
// Output: [[2,2,2,2]]
//
//
//
// Constraints:
//
//
// 1 <= nums.length <= 200
// -10⁹ <= nums[i] <= 10⁹
// -10⁹ <= target <= 10⁹
//
// Related Topics Array Two Pointers Sorting 👍 5726 👎 653

package com.mmmwhy.leetcode.editor.en;

import java.util.*;

public class P18_FourSum {
  public static void main(String[] args) {
    Solution solution = new P18_FourSum().new Solution();
    System.out.println(solution.fourSum(new int[] {1, 0, -1, 0, -2, 2}, 0));
    System.out.println(solution.fourSum(new int[] {2, 2, 2, 2, 2}, 8));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public List<List<Integer>> fourSum(int[] nums, int target) {
      // 构造一个 set string，避免重复
      Set<String> set = new HashSet<>();

      // 对于每一个元素，都转化为 threesum
      Arrays.sort(nums);
      List<List<Integer>> result = new ArrayList<>();
      for (int i = 0; i < nums.length - 3; i++) {
        // 保留三个位置给 j,k,l
        // 结果不重复，因此重复位置直接跳过；
        for (int j = i + 1; j < nums.length - 2; j++) {
          // 保留两个位置给 k,l
          // 结果不重复，重复位置直接跳过
          int k = j + 1, l = nums.length - 1;
          while (k < l) {
            if (nums[i] + nums[j] + nums[k] + nums[l] == target) {
              List<Integer> tempResult = Arrays.asList(nums[i], nums[j], nums[k], nums[l]);
              if (!set.contains(tempResult.toString())) {
                result.add(Arrays.asList(nums[i], nums[j], nums[k], nums[l]));
                set.add(tempResult.toString());
              }
              k++;
              l--;
            } else if (nums[i] + nums[j] + nums[k] + nums[l] < target) {
              k++;
            } else {
              l--;
            }
          }
        }
      }
      return result;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
