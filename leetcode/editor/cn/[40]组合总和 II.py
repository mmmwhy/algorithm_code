from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.res = []
        self.track_list = []
        self.track_sum = 0
    
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        # 一些边界条件
        if sum(candidates) < target:
            return self.res
        
        candidates = sorted(candidates)
        self.back_track(candidates, 0, target)
        return self.res
    
    def back_track(self, candidates, start, target):
        if self.track_sum > target:
            return
        if self.track_sum == target and self.track_list not in self.res:
            self.res.append(self.track_list.copy())
            return
        
        for idx in range(start, len(candidates)):
            if idx > start and candidates[idx] == candidates[idx - 1]:
                # 避免重复数导致耗时增加
                continue
            self.track_sum += candidates[idx]
            self.track_list.append(candidates[idx])
            
            self.back_track(candidates, idx + 1, target)
            
            self.track_list.pop(-1)
            self.track_sum -= candidates[idx]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    # print(solution.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8))
    print(solution.combinationSum2(
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 30))
