// Given a string s, find the length of the longest substring without repeating c
// haracters.
//
//
// Example 1:
//
//
// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
//
//
// Example 2:
//
//
// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
//
//
// Example 3:
//
//
// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a
// substring.
//
//
// Example 4:
//
//
// Input: s = ""
// Output: 0
//
//
//
// Constraints:
//
//
// 0 <= s.length <= 5 * 104
// s consists of English letters, digits, symbols and spaces.
//
// Related Topics Hash Table String Sliding Window
// 👍 19258 👎 880

package com.mmmwhy.leetcode.editor.en;

public class P3_LongestSubstringWithoutRepeatingCharacters {
  public static void main(String[] args) {
    Solution solution = new P3_LongestSubstringWithoutRepeatingCharacters().new Solution();
    String demo = "abcabcbb";
    int result = solution.lengthOfLongestSubstring(demo);
    System.out.println(result);
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public int lengthOfLongestSubstring(String s) {
      int left_point = 0;
      int right_point = 0;
      int biggest_num = 0;
      for (; right_point < s.length(); right_point++) {
        char c = s.charAt(right_point);
        while (s.substring(left_point, right_point).indexOf(c) != -1) {
          left_point += 1;
        }
        if (right_point - left_point + 1 > biggest_num) biggest_num = right_point - left_point + 1;
      }

      return biggest_num;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
