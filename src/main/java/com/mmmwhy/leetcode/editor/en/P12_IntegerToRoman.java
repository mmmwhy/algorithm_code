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
// Given an integer, convert it to a roman numeral.
//
//
// Example 1:
//
//
// Input: num = 3
// Output: "III"
// Explanation: 3 is represented as 3 ones.
//
//
// Example 2:
//
//
// Input: num = 58
// Output: "LVIII"
// Explanation: L = 50, V = 5, III = 3.
//
//
// Example 3:
//
//
// Input: num = 1994
// Output: "MCMXCIV"
// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
//
//
//
// Constraints:
//
//
// 1 <= num <= 3999
//
// Related Topics Hash Table Math String 👍 2850 👎 3841

package com.mmmwhy.leetcode.editor.en;

public class P12_IntegerToRoman {
  public static void main(String[] args) {
    Solution solution = new P12_IntegerToRoman().new Solution();
    System.out.println(solution.intToRoman(3));
    System.out.println(solution.intToRoman(40));
    System.out.println(solution.intToRoman(58));
    System.out.println(solution.intToRoman(1994));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public String intToRoman(int num) {
      StringBuilder result = new StringBuilder();
      // 大于 1000 的部分
      while (num >= 1000) {
        num = num - 1000;
        result.append("M");
      }

      // 1000 ～ 100 的部分
      if (num >= 900) {
        num -= 900;
        result.append("CM");
      }
      if (num >= 500) {
        num -= 500;
        result.append("D");
      }
      if (num >= 400) {
        num -= 400;
        result.append("CD");
      }
      while (num >= 100) {
        num -= 100;
        result.append("C");
      }

      // 100 ～ 10 的部分
      if (num >= 90) {
        num -= 90;
        result.append("XC");
      }
      if (num >= 50) {
        num -= 50;
        result.append("L");
      }
      if (num >= 40) {
        num -= 40;
        result.append("XL");
      }
      while (num >= 10) {
        num -= 10;
        result.append("X");
      }

      // 10 ～ 0 的部分
      if (num >= 9) {
        num -= 9;
        result.append("IX");
      }
      if (num >= 5) {
        num -= 5;
        result.append("V");
      }
      if (num >= 4) {
        num -= 4;
        result.append("IV");
      }
      while (num >= 1) {
        num -= 1;
        result.append("I");
      }
      return result.toString();
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
