// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[
// k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
// Notice that the solution set must not contain duplicate triplets.
//
//
// Example 1:
// Input: nums = [-1,0,1,2,-1,-4]
// Output: [[-1,-1,2],[-1,0,1]]
// Example 2:
// Input: nums = []
// Output: []
// Example 3:
// Input: nums = [0]
// Output: []
//
//
// Constraints:
//
//
// 0 <= nums.length <= 3000
// -10⁵ <= nums[i] <= 10⁵
//
// Related Topics Array Two Pointers Sorting 👍 16384 👎 1569

package com.mmmwhy.leetcode.editor.en;

import java.util.*;

public class P15_ThreeSum {
  public static void main(String[] args) {
    Solution solution = new P15_ThreeSum().new Solution();
    System.out.println(solution.threeSum(new int[] {-1, 0, 1, 2, -1, -4}));
    System.out.println(solution.threeSum(new int[] {}));
    System.out.println(solution.threeSum(new int[] {0}));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {

    // 三次循环
    public List<List<Integer>> threeSum(int[] nums) {
      List<List<Integer>> result = new ArrayList<>();
      // 构建一个 set ，用于 string 后去重
      Set<String> set = new HashSet<>();

      for (int i = 0; i < nums.length; i++) {
        int i_remain = -nums[i];
        for (int j = i + 1; j < nums.length; j++) {
          int j_remain = i_remain - nums[j];
          for (int k = j + 1; k < nums.length; k++) {
            if (j_remain == nums[k]) {
              // 这里只有三个数排序，耗时应该是可以接受的
              List<Integer> singleResult =
                  new ArrayList<>(Arrays.asList(nums[i], nums[j], nums[k]));
              Collections.sort(singleResult);
              if (!set.contains(singleResult.toString())) {
                result.add(singleResult);
                set.add(singleResult.toString());
              }
            }
          }
        }
      }
      return result;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
