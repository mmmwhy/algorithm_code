// Given an integer array nums of length n and an integer target, find three
// integers in nums such that the sum is closest to target.
//
// Return the sum of the three integers.
//
// You may assume that each input would have exactly one solution.
//
//
// Example 1:
//
//
// Input: nums = [-1,2,1,-4], target = 1
// Output: 2
// Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
//
//
// Example 2:
//
//
// Input: nums = [0,0,0], target = 1
// Output: 0
//
//
//
// Constraints:
//
//
// 3 <= nums.length <= 1000
// -1000 <= nums[i] <= 1000
// -10⁴ <= target <= 10⁴
//
// Related Topics Array Two Pointers Sorting 👍 5370 👎 234

package com.mmmwhy.leetcode.editor.en;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class P16_ThreeSumClosest {
    public static void main(String[] args) {
        Solution solution = new P16_ThreeSumClosest().new Solution();
        System.out.println(solution.threeSumClosest(new int[]{-1, 2, 1, -4}, 1));
        System.out.println(solution.threeSumClosest(new int[]{0, 0, 0}, 1));
        System.out.println(solution.threeSumClosest(new int[]{1, 1, 5}, 7));
        System.out.println(solution.threeSumClosest(new int[]{1, 1, -1, -1, 3}, -1));
        System.out.println(solution.threeSumClosest(new int[]{1, 2, 4, 8, 16, 32, 64, 128}, 82));
        System.out.println(solution.threeSumClosest(new int[]{4, 0, 5, -5, 3, 3, 0, -4, -5}, -2));
    }

    // leetcode submit region begin(Prohibit modification and deletion)
    class Solution {
        public int threeSumClosest(int[] nums, int target) {
            //对于每一个元素，都转化为 twosum
            Arrays.sort(nums);
            int finalClosest = 10000000;
            for (int i = 0; i < nums.length - 2; i++) {
                // 给后边两个元素留位置, tempClosest 是计算在这一次 twosum 中最相近的结果
                int tempClosest = 10000000;
                int j = i + 1, k = nums.length - 1;
                while (j < k) {
                    int tempSum = nums[i] + nums[j] + nums[k];
                    // update
                    if (Math.abs(target - tempSum) < Math.abs(target - tempClosest)) {
                        tempClosest = tempSum;
                    }

                    // 根据 tempSum 的结果修正左右指针的位置
                    if (tempSum == target) {
                        // 完美情况，目标直接达成，不考虑后续情况，直接返回;
                        return target;
                    } else if (tempSum < target) {
                        j++;
                    } else {
                        k--;
                    }
                }

                // 外部更新
                if (Math.abs(target - tempClosest) < Math.abs(target - finalClosest)) {
                    finalClosest = tempClosest;
                }
            }
            return finalClosest;
        }
    }
    // leetcode submit region end(Prohibit modification and deletion)

}
