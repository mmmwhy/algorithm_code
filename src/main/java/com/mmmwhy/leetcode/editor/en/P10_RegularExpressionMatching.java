//Given an input string s and a pattern p, implement regular expression 
//matching with support for '.' and '*' where: 
//
// 
// '.' Matches any single character. 
// '*' Matches zero or more of the preceding element. 
// 
//
// The matching should cover the entire input string (not partial). 
//
// 
// Example 1: 
//
// 
//Input: s = "aa", p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
// 
//
// Example 2: 
//
// 
//Input: s = "aa", p = "a*"
//Output: true
//Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, 
//by repeating 'a' once, it becomes "aa".
// 
//
// Example 3: 
//
// 
//Input: s = "ab", p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
// 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 20 
// 1 <= p.length <= 30 
// s contains only lowercase English letters. 
// p contains only lowercase English letters, '.', and '*'. 
// It is guaranteed for each appearance of the character '*', there will be a 
//previous valid character to match. 
// 
// Related Topics String Dynamic Programming Recursion 👍 7608 👎 1096

package com.mmmwhy.leetcode.editor.en;


public class P10_RegularExpressionMatching{
  public static void main(String[] args) {
    Solution solution = new P10_RegularExpressionMatching().new Solution();
    System.out.println(solution.isMatch("aa", "a"));
    System.out.println(solution.isMatch("a", "a*"));
    System.out.println(solution.isMatch("ab", ".*"));
    System.out.println(solution.isMatch("aaasdfasdf", ".*"));
    System.out.println(solution.isMatch("aab", "c*a*b"));
    System.out.println(solution.isMatch("mississippi", "mis*is*p*."));
    System.out.println(solution.isMatch("aaa", "ab*a*c*a"));
  }

//leetcode submit region begin(Prohibit modification and deletion)
class Solution {


    public boolean isMatch(String s, String p) {
      if (s == null || p == null) return false;

      // 动态规划
      // 0、如果 s[0:i) 可以匹配上 p[0:j) ，则将 dp[i][j] 定义为 true;
      // 1、dp[i][j] = dp[i-1][j-1], if (p[i-1]==s[j-1] || p[j-1]=='.') && p[j-1] != '*'
      // 2、dp[i][j] = dp[i][j-2], if p[j-1] == '*'，在只匹配0次的时候触发
      // 3、dp[i][j] = dp[i-1][j] && (s[i-1] == p[j-2] || p[j-2] == '.')，在 p[j-1] == '*' 的时候触发，至少重复一次
      int m = s.length();
      int n = p.length();
      boolean[][] dp = new boolean[m + 1][n + 1];
      dp[0][0] = true;
      for (int i = 0; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
          if (p.charAt(j - 1) == '*') {
            // 匹配 0 次 和至少一次
            dp[i][j] =
                dp[i][j - 2]
                    || (i != 0
                        && dp[i - 1][j]
                        && (p.charAt(j - 2) == '.' || s.charAt(i - 1) == p.charAt(j - 2)));
          } else {
            dp[i][j] =
                i != 0
                    && dp[i - 1][j - 1]
                    && (s.charAt(i - 1) == p.charAt(j - 1) || p.charAt(j - 1) == '.');
          }
        }
      }

      return dp[m][n];
    }

}
//leetcode submit region end(Prohibit modification and deletion)

}