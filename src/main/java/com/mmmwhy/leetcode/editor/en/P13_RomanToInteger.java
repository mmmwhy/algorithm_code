// Roman numerals are represented by seven different symbols: I, V, X, L, C, D
// and M.
//
//
// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
//
// For example, 2 is written as II in Roman numeral, just two one's added
// together. 12 is written as XII, which is simply X + II. The number 27 is written as
// XXVII, which is XX + V + II.
//
// Roman numerals are usually written largest to smallest from left to right.
// However, the numeral for four is not IIII. Instead, the number four is written as
// IV. Because the one is before the five we subtract it making four. The same
// principle applies to the number nine, which is written as IX. There are six
// instances where subtraction is used:
//
//
// I can be placed before V (5) and X (10) to make 4 and 9.
// X can be placed before L (50) and C (100) to make 40 and 90.
// C can be placed before D (500) and M (1000) to make 400 and 900.
//
//
// Given a roman numeral, convert it to an integer.
//
//
// Example 1:
//
//
// Input: s = "III"
// Output: 3
// Explanation: III = 3.
//
//
// Example 2:
//
//
// Input: s = "LVIII"
// Output: 58
// Explanation: L = 50, V= 5, III = 3.
//
//
// Example 3:
//
//
// Input: s = "MCMXCIV"
// Output: 1994
// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
//
//
//
// Constraints:
//
//
// 1 <= s.length <= 15
// s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
// It is guaranteed that s is a valid roman numeral in the range [1, 3999].
//
// Related Topics Hash Table Math String 👍 3304 👎 233

package com.mmmwhy.leetcode.editor.en;

public class P13_RomanToInteger {
  public static void main(String[] args) {
    Solution solution = new P13_RomanToInteger().new Solution();
    System.out.println(solution.romanToInt("III"));
    System.out.println(solution.romanToInt("XL"));
    System.out.println(solution.romanToInt("LVIII"));
    System.out.println(solution.romanToInt("MCMXCIV"));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public int romanToInt(String s) {
      int left = 0;
      int result = 0;

      // 计算 M 位 (1000)
      while (left < s.length() && s.charAt(left) == 'M') {
        left++;
        result += 1000;
      }
      // 计算 CM 位 (900)
      while (left + 1 < s.length() && s.startsWith("CM", left)) {
        left += 2;
        result += 900;
      }

      // 计算 D 位 (500)
      while (left < s.length() && s.charAt(left) == 'D') {
        left++;
        result += 500;
      }

      // 计算 CD 位 (400)
      while (left + 1 < s.length() && s.startsWith("CD", left)) {
        left += 2;
        result += 400;
      }

      // 计算 M 位 (100)
      while (left < s.length() && s.charAt(left) == 'C') {
        left++;
        result += 100;
      }

      // 计算 XC 位 (90)
      while (left + 1 < s.length() && s.startsWith("XC", left)) {
        left += 2;
        result += 90;
      }

      // 计算 L 位 (50)
      while (left < s.length() && s.charAt(left) == 'L') {
        left++;
        result += 50;
      }

      // 计算 XC 位 (40)
      while (left + 1 < s.length() && s.startsWith("XL", left)) {
        left += 2;
        result += 40;
      }

      // 计算 L 位 (10)
      while (left < s.length() && s.charAt(left) == 'X') {
        left++;
        result += 10;
      }

      // 计算 XC 位 (9)
      while (left + 1 < s.length() && s.startsWith("IX", left)) {
        left += 2;
        result += 9;
      }

      // 计算 L 位 (5)
      while (left < s.length() && s.charAt(left) == 'V') {
        left++;
        result += 5;
      }

      // 计算 XC 位 (4)
      while (left + 1 < s.length() && s.startsWith("IV", left)) {
        left += 2;
        result += 4;
      }

      // 计算 L 位 (1)
      while (left < s.length() && s.charAt(left) == 'I') {
        left++;
        result += 1;
      }
      return result;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
