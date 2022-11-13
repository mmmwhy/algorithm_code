from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        self.res = []
        self.track_list = []
        self.track_sum = 0
        
        candidates = sorted(candidates)
        self.back_track(candidates, 0, target)
        return self.res
    
    def back_track(self, candidates, start, target):
        if self.track_sum == target:
            self.res.append(self.track_list.copy())
        
        for idx in range(start, len(candidates)):
            if self.track_sum + candidates[idx] > target:
                # 后边的更大，不用考虑了
                continue
            
            self.track_sum += candidates[idx]
            self.track_list.append(candidates[idx])
            
            self.back_track(candidates, idx, target)
            
            self.track_list.pop(-1)
            self.track_sum -= candidates[idx]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.combinationSum([2, 3, 6, 7], 7))
    print(solution.combinationSum([2, 3, 5], 8))
