from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findRepeatedDnaSequences(self, s: str) -> List[str]:
        seen = set()
        res = set()
        
        for start_idx in range(len(s) - 9):
            sub_str = s[start_idx:start_idx + 10]
            if sub_str in seen:
                res.add(sub_str)
            else:
                seen.add(sub_str)
        return list(res)


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
    
    print(solution.findRepeatedDnaSequences("AAAAAAAAAAA"))
