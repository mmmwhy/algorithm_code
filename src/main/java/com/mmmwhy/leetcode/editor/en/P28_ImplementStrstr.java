// Implement strStr().
//
// Return the index of the first occurrence of needle in haystack, or -1 if
// needle is not part of haystack.
//
// Clarification:
//
// What should we return when needle is an empty string? This is a great
// question to ask during an interview.
//
// For the purpose of this problem, we will return 0 when needle is an empty
// string. This is consistent to C's strstr() and Java's indexOf().
//
//
// Example 1:
// Input: haystack = "hello", needle = "ll"
// Output: 2
// Example 2:
// Input: haystack = "aaaaa", needle = "bba"
// Output: -1
// Example 3:
// Input: haystack = "", needle = ""
// Output: 0
//
//
// Constraints:
//
//
// 0 <= haystack.length, needle.length <= 5 * 10⁴
// haystack and needle consist of only lower-case English characters.
//
// Related Topics Two Pointers String String Matching 👍 3724 👎 3510

package com.mmmwhy.leetcode.editor.en;

public class P28_ImplementStrstr {
  public static void main(String[] args) {
    Solution solution = new P28_ImplementStrstr().new Solution();
    System.out.println(solution.strStr("hello", "ll"));
    System.out.println(solution.strStr("hello", ""));
    System.out.println(solution.strStr("", ""));
    System.out.println(solution.strStr("a", "a"));
    System.out.println(solution.strStr("aaaaa", "bba"));
    System.out.println(solution.strStr("abc", "c"));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public int strStr(String haystack, String needle) {

      // 边界条件
      if (needle.isEmpty()) {
        return 0;
      }
      // 挨个匹配就可以了
      for (int i = 0; i <= (haystack.length() - needle.length()); i++) {
        if (haystack.startsWith(needle, i)) {
          return i;
        }
      }

      return -1;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
