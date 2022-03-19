// Write a function to find the longest common prefix string amongst an array of
// strings.
//
// If there is no common prefix, return an empty string "".
//
//
// Example 1:
//
//
// Input: strs = ["flower","flow","flight"]
// Output: "fl"
//
//
// Example 2:
//
//
// Input: strs = ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.
//
//
//
// Constraints:
//
//
// 1 <= strs.length <= 200
// 0 <= strs[i].length <= 200
// strs[i] consists of only lower-case English letters.
//
// Related Topics String 👍 7154 👎 2843

package com.mmmwhy.leetcode.editor.en;

public class P14_LongestCommonPrefix {
  public static void main(String[] args) {
    Solution solution = new P14_LongestCommonPrefix().new Solution();
    System.out.println(solution.longestCommonPrefix(new String[] {"flower", "flow", "flight"}));
    System.out.println(solution.longestCommonPrefix(new String[] {"fower", "flow", "flight"}));
    System.out.println(solution.longestCommonPrefix(new String[] {"f", "f", "f"}));
    System.out.println(solution.longestCommonPrefix(new String[] {"a", "", "b"}));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public String longestCommonPrefix(String[] strs) {
      int minLength = Integer.MAX_VALUE;
      for (String str : strs) {
        minLength = Math.min(minLength, str.length());
      }

      StringBuffer res = new StringBuffer();

      for (int i = 0; i < minLength; i++) {
        // i 表示的是每一个字
        int j = 1;
        for (; j < strs.length; j++) {
          // j 表示的是每一个句子，从第二个句子开始
          if (strs[j].charAt(i) != strs[j - 1].charAt(i)) {
            break;
          }
        }
        // 如果这个字循环结束了
        if (j == strs.length) {
          res.append(strs[0].charAt(i));
        } else {
          // 后续的也不用看了
          break;
        }
      }

      return res.toString();
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
