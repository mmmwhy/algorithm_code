import collections


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def removeDuplicateLetters(self, s: str) -> str:
        res = []
        remain_counter = collections.Counter(s)
        
        for value in s:
            if value not in res:
                while res and value < res[-1] and remain_counter[res[-1]] > 0:
                    res.pop(-1)
                
                res.append(value)
            remain_counter[value] -= 1
        
        return "".join(res)


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.removeDuplicateLetters("abcd"), "abcd")
    print(solution.removeDuplicateLetters("bcabc"), "abc")
    print(solution.removeDuplicateLetters("cbacdcbc"), "acdb")
