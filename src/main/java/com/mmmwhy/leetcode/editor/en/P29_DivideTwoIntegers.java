// Given two integers dividend and divisor, divide two integers without using
// multiplication, division, and mod operator.
//
// The integer division should truncate toward zero, which means losing its
// fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be
// truncated to -2.
//
// Return the quotient after dividing dividend by divisor.
//
// Note: Assume we are dealing with an environment that could only store
// integers within the 32-bit signed integer range: [−2³¹, 2³¹ − 1]. For this problem, if
// the quotient is strictly greater than 2³¹ - 1, then return 2³¹ - 1, and if the
// quotient is strictly less than -2³¹, then return -2³¹.
//
//
// Example 1:
//
//
// Input: dividend = 10, divisor = 3
// Output: 3
// Explanation: 10/3 = 3.33333.. which is truncated to 3.
//
//
// Example 2:
//
//
// Input: dividend = 7, divisor = -3
// Output: -2
// Explanation: 7/-3 = -2.33333.. which is truncated to -2.
//
//
//
// Constraints:
//
//
// -2³¹ <= dividend, divisor <= 2³¹ - 1
// divisor != 0
//
// Related Topics Math Bit Manipulation 👍 2601 👎 9155

package com.mmmwhy.leetcode.editor.en;

import java.util.Arrays;

public class P29_DivideTwoIntegers {
  public static void main(String[] args) {
    Solution solution = new P29_DivideTwoIntegers().new Solution();
    System.out.println(Arrays.asList(solution.divide(10, -3), 3));
    System.out.println(Arrays.asList(solution.divide(7, -3), -2));
    System.out.println(Arrays.asList(solution.divide(7, 3), 2));
    System.out.println(Arrays.asList(solution.divide(6, -3), 0));
    System.out.println(Arrays.asList(solution.divide(6, 3), 0));
    System.out.println(Arrays.asList(solution.divide(-2147483648, -1), 0));
    System.out.println(Arrays.asList(solution.divide(-2147483648, 1), 0));
    System.out.println(Arrays.asList(solution.divide(-2147483648, -2147483648), 1));
    System.out.println(Arrays.asList(solution.divide(2147483647, -2147483648), -1));
    System.out.println(Arrays.asList(solution.divide(1, -1), 0));
    System.out.println(Arrays.asList(solution.divide(-2147483648, -1), 2147483647));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public int divide(int dividend, int divisor) {
      if (dividend == 1 << 31 && divisor == -1) return (1 << 31) - 1;
      int dvd = Math.abs(dividend), dvs = Math.abs(divisor), res = 0, x = 0;
      while (dvd - dvs >= 0) {
        for (x = 0; dvd - (dvs << x << 1) >= 0; x++)
          ;
        res += 1 << x;
        dvd -= dvs << x;
      }
      return (dividend > 0) == (divisor > 0) ? res : -res;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
