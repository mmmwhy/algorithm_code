//Given a string containing digits from 2-9 inclusive, return all possible 
//letter combinations that the number could represent. Return the answer in any order. 
//
//
// A mapping of digit to letters (just like on the telephone buttons) is given 
//below. Note that 1 does not map to any letters. 
//
// 
//
// 
// Example 1: 
//
// 
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
// 
//
// Example 2: 
//
// 
//Input: digits = ""
//Output: []
// 
//
// Example 3: 
//
// 
//Input: digits = "2"
//Output: ["a","b","c"]
// 
//
// 
// Constraints: 
//
// 
// 0 <= digits.length <= 4 
// digits[i] is a digit in the range ['2', '9']. 
// 
// Related Topics Hash Table String Backtracking 👍 9187 👎 640

package com.mmmwhy.leetcode.editor.en;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P17_LetterCombinationsOfAPhoneNumber{
  public static void main(String[] args) {
    Solution solution = new P17_LetterCombinationsOfAPhoneNumber().new Solution();
    System.out.println(solution.letterCombinations("23"));
    System.out.println(solution.letterCombinations("2345"));
    System.out.println(solution.letterCombinations("2"));
    System.out.println(solution.letterCombinations(""));
  }
  

//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public List<String> letterCombinations(String digits) {

      return helper(new ArrayList<>(), digits);
    }

    public List<String> helper(List<String> lastResult, String remainDigits) {
      Map<Character, String> map = new HashMap<Character, String>();
      map.put('2', "abc");
      map.put('3', "def");
      map.put('4', "ghi");
      map.put('5', "jkl");
      map.put('6', "mno");
      map.put('7', "pqrs");
      map.put('8', "tuv");
      map.put('9', "wxyz");

      // 到头了
      if (remainDigits.length() == 0) {
        return lastResult;
      }
      // 第一个字
      if (lastResult.isEmpty()) {
        ArrayList<String> result = new ArrayList<>();
        for (int j = 0; j < map.get(remainDigits.charAt(0)).length(); j++) {
          // 每个数字对应的字符
          result.add(String.valueOf(map.get(remainDigits.charAt(0)).charAt(j)));
        }
        return helper(result, remainDigits.substring(1));
      }

      // 其余字
      ArrayList<String> resultList = new ArrayList<String>();
      for (String line : lastResult) {
        for (int j = 0; j < map.get(remainDigits.charAt(0)).length(); j++) {
          // 每个数字对应的字符
          resultList.add(line + String.valueOf(map.get(remainDigits.charAt(0)).charAt(j)));
        }
      }
      return helper(resultList, remainDigits.substring(1));
    }

    public List<String> letterCombinations2(String digits) {
      Map<Character, String> map = new HashMap<Character, String>();
      map.put('2', "abc");
      map.put('3', "def");
      map.put('4', "ghi");
      map.put('5', "jkl");
      map.put('6', "mno");
      map.put('7', "pqrs");
      map.put('8', "tuv");
      map.put('9', "wxyz");

      ArrayList<String> result = new ArrayList<>();
      ArrayList<String> newResult = new ArrayList<>();

      for (int i = 0; i < digits.length(); i++) {
        if (i == 0) {
          // 第一个数字肯定会命中
          for (int j = 0; j < map.get(digits.charAt(i)).length(); j++) {
            // 每个数字对应的字符
            result.add(String.valueOf(map.get(digits.charAt(i)).charAt(j)));
          }
        } else {
          for (int k = 0; k < result.size(); k++) {
            for (int j = 0; j < map.get(digits.charAt(i)).length(); j++) {
              // 每个数字对应的字符
              newResult.add(result.get(k) + map.get(digits.charAt(i)).charAt(j));
            }
          }
          result = (ArrayList<String>) newResult.clone();
          newResult.clear();
        }
      }

      return result;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}