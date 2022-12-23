import collections


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def smallestSubsequence(self, s: str) -> str:
        queue = []
        remain_counter = collections.Counter(s)
        
        for c in s:
            if c not in queue:
                while queue and queue[-1] > c and remain_counter[queue[-1]] > 0:
                    queue.pop()
                
                queue.append(c)
            remain_counter[c] -= 1
        
        return "".join(queue)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.smallestSubsequence("abcd"), "abcd")
    print(solution.smallestSubsequence("bcabc"), "abc")
    print(solution.smallestSubsequence("cbacdcbc"), "acdb")
