//You are given an integer array height of length n. There are n vertical lines 
//drawn such that the two endpoints of the iᵗʰ line are (i, 0) and (i, height[i]).
// 
//
// Find two lines that together with the x-axis form a container, such that the 
//container contains the most water. 
//
// Return the maximum amount of water a container can store. 
//
// Notice that you may not slant the container. 
//
// 
// Example 1: 
//
// 
//Input: height = [1,8,6,2,5,4,8,3,7]
//Output: 49
//Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,
//3,7]. In this case, the max area of water (blue section) the container can 
//contain is 49.
// 
//
// Example 2: 
//
// 
//Input: height = [1,1]
//Output: 1
// 
//
// 
// Constraints: 
//
// 
// n == height.length 
// 2 <= n <= 10⁵ 
// 0 <= height[i] <= 10⁴ 
// 
// Related Topics Array Two Pointers Greedy 👍 14656 👎 878

package com.mmmwhy.leetcode.editor.en;


import java.util.Arrays;

public class P11_ContainerWithMostWater {
    public static void main(String[] args) {
        Solution solution = new P11_ContainerWithMostWater().new Solution();
        // 49
        System.out.println(solution.maxArea(new int[]{1, 8, 6, 2, 5, 4, 8, 3, 7}));
        // 1
        System.out.println(solution.maxArea(new int[]{1, 1}));
        // 18048
        System.out.println(solution.maxArea(new int[]{76, 155, 15, 188, 180, 154, 84, 34, 187, 142, 22, 5, 27, 183, 111, 128, 50, 58, 2, 112, 179, 2, 100, 111, 115, 76, 134, 120, 118, 103, 31, 146, 58, 198, 134, 38, 104, 170, 25, 92, 112, 199, 49, 140, 135, 160, 20, 185, 171, 23, 98, 150, 177, 198, 61, 92, 26, 147, 164, 144, 51, 196, 42, 109, 194, 177, 100, 99, 99, 125, 143, 12, 76, 192, 152, 11, 152, 124, 197, 123, 147, 95, 73, 124, 45, 86, 168, 24, 34, 133, 120, 85, 81, 163, 146, 75, 92, 198, 126, 191}));
        // 4
        System.out.println(solution.maxArea(new int[]{1, 2, 4, 3}));
        // 6
        System.out.println(solution.maxArea(new int[]{1, 4, 2, 3}));
        // 24
        System.out.println(solution.maxArea(
                new int[]{1, 3, 2, 5, 25, 24, 5}));
        // 200
        System.out.println(solution.maxArea(
                new int[]{1, 8, 100, 2, 100, 4, 8, 3, 7}));
        // 62
        System.out.println(solution.maxArea(
                new int[]{6, 4, 3, 1, 4, 6, 99, 62, 1, 2, 6}));
    }


    //leetcode submit region begin(Prohibit modification and deletion)
    class Solution {
        public int maxArea(int[] height) {
            // 那一边小，调整那一边
            // if height[left] < height[right], left ++
            // else right --

            int nowArea = 0;
            int left = 0, right = height.length - 1;

            while (left < right) {
                nowArea = Math.max(nowArea, (right - left) * (Math.min(height[left], height[right])));
                if (height[left] < height[right]) {
                    left++;
                } else {
                    right--;
                }
            }
            return nowArea;
        }

        // 递归，目测会超时。
        public int maxArea2(int[] height) {
            int nowArea = (height.length - 1) * (Math.min(height[0], height[height.length - 1]));
            if (height.length >= 2) {
                int leftMoveArea = maxArea(Arrays.copyOfRange(height, 1, height.length));
                int rightMoveArea = maxArea(Arrays.copyOfRange(height, 0, height.length - 1));
                nowArea = Math.max(nowArea, Math.max(leftMoveArea, rightMoveArea));
            }
            return nowArea;

        }
    }
//leetcode submit region end(Prohibit modification and deletion)

}
