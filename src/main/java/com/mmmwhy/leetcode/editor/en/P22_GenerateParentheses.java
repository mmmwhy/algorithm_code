// Given n pairs of parentheses, write a function to generate all combinations
// of well-formed parentheses.
//
//
// Example 1:
// Input: n = 3
// Output: ["((()))","(()())","(())()","()(())","()()()"]
// Example 2:
// Input: n = 1
// Output: ["()"]
//
//
// Constraints:
//
//
// 1 <= n <= 8
//
// Related Topics String Dynamic Programming Backtracking 👍 12091 👎 471

package com.mmmwhy.leetcode.editor.en;

import java.util.ArrayList;
import java.util.List;

public class P22_GenerateParentheses {
  public static void main(String[] args) {
    Solution solution = new P22_GenerateParentheses().new Solution();
    System.out.println(solution.generateParenthesis(1));
    System.out.println(solution.generateParenthesis(2));
    System.out.println(solution.generateParenthesis(3));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public List<String> generateParenthesis(int n) {
      return helper(new ArrayList<>(), n, n);
    }

    public List<String> helper(List<String> resultList, int countLeft, int countRight) {
      // 左括号的数据必须时刻大于右括号的数量
      if (countLeft == countRight) {
        // 相等的时候需要注入 (
        ArrayList<String> tempResult = new ArrayList<String>();
        if (resultList.isEmpty()) {
          tempResult.add("(");
        } else {
          for (String line : resultList) {
            tempResult.add(line + "(");
          }
        }
        return helper(tempResult, countLeft - 1, countRight);
      }

      if (countLeft == 0) {
        // 只能出了
        ArrayList<String> tempResult = new ArrayList<String>();
        for (String line : resultList) {
          StringBuilder right = new StringBuilder();
          while (countRight > 0) {
            countRight--;
            right.append(')');
          }
          tempResult.add(line + right);
        }
        return tempResult;
      }

      // 其余 countLeft < countRight 的情况
      // 我们先增加 ( 括号
      ArrayList<String> tempResult2 = new ArrayList<String>();
      for (String line : resultList) {
        tempResult2.add(line + "(");
      }
      List<String> result2 = helper(tempResult2, countLeft - 1, countRight);

      // 我们再增加 ) 括号
      ArrayList<String> tempResult3 = new ArrayList<String>();
      for (String line : resultList) {
        tempResult3.add(line + ")");
      }
      List<String> result3 = helper(tempResult3, countLeft, countRight - 1);

      ArrayList<String> tempResult4 = new ArrayList<String>();
      tempResult4.addAll(result2);
      tempResult4.addAll(result3);

      return tempResult4;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
