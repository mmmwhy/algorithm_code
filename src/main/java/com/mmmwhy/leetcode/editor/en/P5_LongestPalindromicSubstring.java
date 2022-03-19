// Given a string s, return the longest palindromic substring in s.
//
//
// Example 1:
//
//
// Input: s = "babad"
// Output: "bab"
// Explanation: "aba" is also a valid answer.
//
//
// Example 2:
//
//
// Input: s = "cbbd"
// Output: "bb"
//
//
//
// Constraints:
//
//
// 1 <= s.length <= 1000
// s consist of only digits and English letters.
//
// Related Topics String Dynamic Programming
// 👍 16064 👎 949

package com.mmmwhy.leetcode.editor.en;

public class P5_LongestPalindromicSubstring {
  public static void main(String[] args) {
    Solution solution = new P5_LongestPalindromicSubstring().new Solution();
    System.out.println(solution.longestPalindrome("babad"));
    System.out.println(solution.longestPalindrome("cbbd"));

    System.out.println("123456".substring(1, 5));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public String longestPalindrome(String s) {
      if (s.length() == 0) {
        return "";
      }
      if (s.length() == 1) {
        return s;
      }
      String longest_result = "";
      for (int left = 0; left < s.length() - 1; left++) {

        // s[left] == s[left] -> count_1 >= 1 -> 单核心
        int count_1 = checkPalindrome(s, left, left) - 1;
        // 比如 bab 中的 a
        String s1 = s.substring(left - count_1, left + count_1 + 1);
        if (s1.length() > longest_result.length()) {
          longest_result = s1;
        }

        // 如果 s[left] == s[left + 1] -> 出现双核心
        if (left < s.length() - 1 && s.charAt(left) == s.charAt(left + 1)) {
          int count_2 = checkPalindrome(s, left, left + 1) - 1;
          // 比如 abba 中的 bb
          String s2 = s.substring(left - count_2, left + count_2 + 2);
          if (s2.length() > longest_result.length()) {
            longest_result = s2;
          }
        }
      }
      return longest_result;
    }

    public int checkPalindrome(String s, int left, int right) {
      int count = 0;
      while (left - count >= 0 && right + count < s.length()) {
        if (s.charAt(left - count) == s.charAt(right + count)) {
          count += 1;
        } else {
          break;
        }
      }
      return count;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
