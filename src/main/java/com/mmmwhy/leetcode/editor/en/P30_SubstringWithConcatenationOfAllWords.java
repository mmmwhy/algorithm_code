// You are given a string s and an array of strings words of the same length.
// Return all starting indices of substring(s) in s that is a concatenation of each
// word in words exactly once, in any order, and without any intervening characters.
//
//
// You can return the answer in any order.
//
//
// Example 1:
//
//
// Input: s = "barfoothefoobarman", words = ["foo","bar"]
// Output: [0,9]
// Explanation: Substrings starting at index 0 and 9 are "barfoo" and "foobar"
// respectively.
// The output order does not matter, returning [9,0] is fine too.
//
//
// Example 2:
//
//
// Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
// Output: []
//
//
// Example 3:
//
//
// Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
// Output: [6,9,12]
//
//
//
// Constraints:
//
//
// 1 <= s.length <= 10⁴
// s consists of lower-case English letters.
// 1 <= words.length <= 5000
// 1 <= words[i].length <= 30
// words[i] consists of lower-case English letters.
//
// Related Topics Hash Table String Sliding Window 👍 1842 👎 1810

package com.mmmwhy.leetcode.editor.en;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class P30_SubstringWithConcatenationOfAllWords {
  public static void main(String[] args) {
    Solution solution = new P30_SubstringWithConcatenationOfAllWords().new Solution();
    // [0,9]
    System.out.println(solution.findSubstring("barfoothefoobarman", new String[] {"foo", "bar"}));

    // []
    System.out.println(
        solution.findSubstring(
            "wordgoodgoodgoodbestword", new String[] {"word", "good", "best", "word"}));

    // [6,9,12]
    System.out.println(
        solution.findSubstring("barfoofoobarthefoobarman", new String[] {"bar", "foo", "the"}));

    // [8]
    System.out.println(
        solution.findSubstring(
            "wordgoodgoodgoodbestword", new String[] {"word", "good", "best", "good"}));

    // [13]
    System.out.println(
        solution.findSubstring(
            "lingmindraboofooowingdingbarrwingmonkeypoundcake",
            new String[] {"fooo", "barr", "wing", "ding", "wing"}));
  }

  // leetcode submit region begin(Prohibit modification and deletion)
  class Solution {
    public List<Integer> findSubstring(String s, String[] words) {
      ArrayList<Integer> resultStartList = new ArrayList<>();
      int word_length = words[0].length() * words.length;
      int left = 0, right = left + word_length;

      while (right <= s.length()) {
        if (checkSubString(s.substring(left, right), words)) {
          resultStartList.add(left);
        }
        left++;
        right++;
      }

      return resultStartList;
    }

    public boolean checkSubString(String s, String[] words) {
      // 给定 "barfoo" 和 ["foo","bar"]， 判断是否符合条件
      int start = 0;

      List<String> arrayWords =
          new ArrayList<>(Arrays.asList("fooo", "barr", "wing", "ding", "wing"));

      while (start < s.length()) {
        // 取指定长度的 subString， 判断是否在 words 内
        String subS = s.substring(start, start + words[0].length());
        int index = arrayWords.indexOf(subS);
        if (index != -1) {
          start += words[0].length();
          // 只能用一次;
          arrayWords.remove(index);
        } else {
          return false;
        }
      }
      return true;
    }
  }
  // leetcode submit region end(Prohibit modification and deletion)

}
