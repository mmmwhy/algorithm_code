// Given a string containing just the characters '(' and ')', find the length of
// the longest valid (well-formed) parentheses substring.
//
//
// Example 1:
//
//
// Input: s = "(()"
// Output: 2
// Explanation: The longest valid parentheses substring is "()".
//
//
// Example 2:
//
//
// Input: s = ")()())"
// Output: 4
// Explanation: The longest valid parentheses substring is "()()".
//
//
// Example 3:
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
// 0 <= s.length <= 3 * 10⁴
// s[i] is '(', or ')'.
//
// Related Topics String Dynamic Programming Stack 👍 7665 👎 264

package com.mmmwhy.leetcode.editor.en;

import java.util.Stack;

public class P32_LongestValidParentheses {
    public static void main(String[] args) {
        Solution solution = new P32_LongestValidParentheses().new Solution();
        // 2
        System.out.println(solution.longestValidParentheses("(()"));
        // 4
        System.out.println(solution.longestValidParentheses(")()())"));
        // 0
        System.out.println(solution.longestValidParentheses(""));
        // 2
        System.out.println(solution.longestValidParentheses("()(()"));
        // 6
        System.out.println(solution.longestValidParentheses("()(())"));
    }

    // leetcode submit region begin(Prohibit modification and deletion)
    class SolutionBrute {
        public boolean isVaild(String s) {
            Stack<Character> stack = new Stack<>();
            for (int i = 0; i < s.length(); i++) {
                if (s.charAt(i) == '(') {
                    stack.push('(');
                } else if (!stack.empty() && s.charAt(i) == ')') {
                    stack.pop();
                } else {
                    return false;
                }
            }
            return stack.empty();
        }

        public int longestValidParentheses(String s) {
            int maxLen = 0;
            for (int i = 0; i < s.length(); i++) {
                for (int j = i + 2; j <= s.length(); j += 2) {
                    if (isVaild(s.substring(i, j))) {
                        maxLen = Math.max(maxLen, j - i);
                    }
                }
            }
            return maxLen;
        }
    }

    class Solution {
        public int longestValidParentheses(String s) {
            int maxLen = 0;
            // 截止 i 位置，连续的有效字符串, 初始化为 0
            int dp[] = new int[s.length()];
            for (int i = 1; i < s.length(); i++) {
                if (s.charAt(i) == ')') {
                    if (s.charAt(i - 1) == '(') {
                        // 如果 i-1 是 (
                        if (i - 2 >= 0) {
                            dp[i] = dp[i - 2] + 2;
                        } else {
                            dp[i] = 2;
                        }
                    } else if (i - dp[i - 1] - 1 >= 0 && s.charAt(i - dp[i - 1] - 1) == '(') {
                        // 如果 i-1 是 ），且 xxx
                        if (i - dp[i - 1] - 2 >= 0) {
                            dp[i] = dp[i - 1] + dp[i - dp[i - 1] - 2] + 2;
                        } else {
                            dp[i] = dp[i - 1] + 2;
                        }

                    }
                    maxLen = Math.max(maxLen, dp[i]);
                }
            }
            return maxLen;
        }
    }

    class SolutionStack {
        public int longestValidParentheses(String s) {
            if (s.length() <= 1) {
                return 0;
            }

            int maxAns = 0;
            Stack<Integer> stack = new Stack<>();
            stack.push(-1);
            for (int i = 0; i < s.length(); i++) {
                if (s.charAt(i) == '(') {
                    stack.push(i);
                } else {
                    stack.pop();
                    if (stack.empty()) {
                        stack.push(i);
                    } else {
                        maxAns = Math.max(maxAns, i - stack.peek());
                    }
                }
            }
            return maxAns;
        }
    }
    // leetcode submit region end(Prohibit modification and deletion)

}
