// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number
// of rows like this: (you may want to display this pattern in a fixed font for
// better legibility)
//
//
// P   A   H   N
// A P L S I I G
// Y   I   R
//
//
// And then read line by line: "PAHNAPLSIIGYIR"
//
// Write the code that will take a string and make this conversion given a
// number of rows:
//
//
// string convert(string s, int numRows);
//
//
//
// Example 1:
//
//
// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"
//
//
// Example 2:
//
//
// Input: s = "PAYPALISHIRING", numRows = 4
// Output: "PINALSIGYAHRPI"
// Explanation:
// P     I    N
// A   L S  I G
// Y A   H R
// P     I
//
//
// Example 3:
//
//
// Input: s = "A", numRows = 1
// Output: "A"
//
//
//
// Constraints:
//
//
// 1 <= s.length <= 1000
// s consists of English letters (lower-case and upper-case), ',' and '.'.
// 1 <= numRows <= 1000
//
// Related Topics String 👍 3371 👎 7826

package com.mmmwhy.leetcode.editor.en;

public class P6_ZigzagConversion {
  public static void main(String[] args) {
    Solution solution = new P6_ZigzagConversion().new Solution();
    System.out.println(solution.convert("ABC", 5));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public String convert(String s, int numRows) {
      if (s.length() <= numRows || numRows == 1) {
        return s;
      }

      StringBuilder newString = new StringBuilder();
      for (int i = 0; i < numRows; i++) {
        int j = i;
        newString.append(s.charAt(j));
        while (j < s.length()) {
          int newJ = j + 2 * numRows - 2 - (2 * i);
          if (newJ >= s.length()) {
            break;
          }
          if (newJ != j) {
            j = newJ;
            newString.append(s.charAt(j));
          }
          newJ = j + 2 * i;
          if (newJ >= s.length()) {
            break;
          }
          if (newJ != j) {
            j = newJ;
            newString.append(s.charAt(j));
          }
        }
      }
      return String.valueOf(newString);
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
