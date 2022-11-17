from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 1:
            return strs[0]
        
        min_length = 200
        for sub_str in strs:
            min_length = min(len(sub_str), min_length)
        
        idx = 1
        while idx <= min_length:
            flag = True
            for sub_str in strs[1:]:
                if sub_str[:idx] != strs[0][:idx]:
                    flag = False
                    break
            if not flag:
                break
            else:
                idx += 1
        return strs[0][:idx - 1]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.longestCommonPrefix(["ab", "a"]))
    print(solution.longestCommonPrefix(["flower", "flow", "flight"]))
    print(solution.longestCommonPrefix(["dog", "racecar", "car"]))
