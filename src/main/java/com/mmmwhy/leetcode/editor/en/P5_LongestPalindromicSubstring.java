//Given a string s, return the longest palindromic substring in s. 
//
// 
// Example 1: 
//
// 
//Input: s = "babad"
//Output: "bab"
//Explanation: "aba" is also a valid answer.
// 
//
// Example 2: 
//
// 
//Input: s = "cbbd"
//Output: "bb"
// 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 1000 
// s consist of only digits and English letters. 
// 
// Related Topics String Dynamic Programming 
// 👍 16064 👎 949

package com.mmmwhy.leetcode.editor.en;


public class P5_LongestPalindromicSubstring {
    public static void main(String[] args) {
        Solution solution = new P5_LongestPalindromicSubstring().new Solution();
        System.out.println(solution.longestPalindrome("babad"));
        System.out.println(solution.longestPalindrome("cbbd"));
    }


    //leetcode submit region begin(Prohibit modification and deletion)
    class Solution {
        public String longestPalindrome(String s) {
            if (s.length() == 0) {
                return "";
            }
            if (s.length() == 1){
                return s;
            }
            String longest_result = "";
            for (int left = 0; left < s.length() - 1; left++) {
                int right = left + 1;
                int count_1 = checkPalindrome(s, left, left);
                int count_2 = checkPalindrome(s, left, right);
                if (s.substring(left - count_1 + 1, left + count_1).length() > longest_result.length()) {
                    longest_result = s.substring(left - count_1 + 1, left + count_1);
                }
                if (s.substring(left - count_2 + 1, right + count_2).length() + 1> longest_result.length()) {
                    longest_result = s.substring(left - count_2 + 1, right + count_2);
                    ;
                }
            }
            return longest_result;
        }

        public int checkPalindrome(String s, int left, int right) {
            int count = 0;
            while (left - count >= 0 && right + count < s.length()) {
                if (s.charAt(left - count) == s.charAt(right + count)) {
                    count += 1;
                } else {
                    break;
                }
            }
            return count;
        }
    }
//leetcode submit region end(Prohibit modification and deletion)

}