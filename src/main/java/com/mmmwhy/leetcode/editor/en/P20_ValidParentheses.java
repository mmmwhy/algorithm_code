// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']
// ', determine if the input string is valid.
//
// An input string is valid if:
//
//
// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
//
//
//
// Example 1:
//
//
// Input: s = "()"
// Output: true
//
//
// Example 2:
//
//
// Input: s = "()[]{}"
// Output: true
//
//
// Example 3:
//
//
// Input: s = "(]"
// Output: false
//
//
//
// Constraints:
//
//
// 1 <= s.length <= 10⁴
// s consists of parentheses only '()[]{}'.
//
// Related Topics String Stack 👍 11826 👎 517

package com.mmmwhy.leetcode.editor.en;

import java.util.Stack;

public class P20_ValidParentheses {
  public static void main(String[] args) {
    Solution solution = new P20_ValidParentheses().new Solution();
    System.out.println(solution.isValid("()"));
    System.out.println(solution.isValid("()[]{}"));
    System.out.println(solution.isValid("(]"));
    System.out.println(solution.isValid("("));
    System.out.println(solution.isValid("]"));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public boolean isValid(String s) {
      // 需要使用到 Stack 栈
      Stack<Character> stack = new Stack<>();
      for (int i = 0; i < s.length(); i++) {
        if (stack.isEmpty()) {
          stack.push(s.charAt(i));
        } else {

          char popChar = stack.peek();

          // 合并的情况
          if (popChar == '(' && s.charAt(i) == ')'
              || popChar == '[' && s.charAt(i) == ']'
              || popChar == '{' && s.charAt(i) == '}') {
            stack.pop();
          }
          // 继续入栈
          else if (popChar == '(' || popChar == '[' || popChar == '{') {
            stack.push(s.charAt(i));
          } else {
            return false;
          }
        }
      }
      return stack.isEmpty();
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
