// Given a signed 32-bit integer x, return x with its digits reversed. If
// reversing x causes the value to go outside the signed 32-bit integer range [-2³¹, 2³¹ -
// 1], then return 0.
//
// Assume the environment does not allow you to store 64-bit integers (signed
// or unsigned).
//
//
// Example 1:
//
//
// Input: x = 123
// Output: 321
//
//
// Example 2:
//
//
// Input: x = -123
// Output: -321
//
//
// Example 3:
//
//
// Input: x = 120
// Output: 21
//
//
//
// Constraints:
//
//
// -2³¹ <= x <= 2³¹ - 1
//
// Related Topics Math 👍 6630 👎 9320

package com.mmmwhy.leetcode.editor.en;

public class P7_ReverseInteger {
  public static void main(String[] args) {
    Solution solution = new P7_ReverseInteger().new Solution();
    // 2147483648
    System.out.println(solution.reverse(-2147483648));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public int reverse(int x) {
      if (x == -2147483648) {
        return 0;
      }

      // 默认认为是正数
      boolean negative = false;
      if (x < 0) {
        negative = true;
        x = -x;
      }

      int result = 0;
      while (x != 0) {
        // 如果满足了这一步，后边不可能出现比 7 大的数，要不然输入的就不是 int
        if (result > 214748364) {
          return 0;
        }
        result = result * 10 + (x % 10);
        x /= 10;
      }

      if (negative) {
        return -result;
      } else {
        return result;
      }
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
