# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        left, right, max_length = 0, 0, 0
        while right < len(s):
            if s[right] in s[left:right]:
                left += 1
            else:
                # 如果 right 不被包含，那么需要先记录结果
                right += 1
                max_length = max(max_length, right - left)
        
        return max_length


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.lengthOfLongestSubstring("abcabcbb"))
    print(solution.lengthOfLongestSubstring("bbbbb"))
    print(solution.lengthOfLongestSubstring("pwwkew"))
    print(solution.lengthOfLongestSubstring(""))
