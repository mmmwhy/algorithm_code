from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.res = []
    
    def permute(self, nums: List[int]) -> List[List[int]]:
        self.back_track(nums, [], [False] * len(nums))
        return self.res
    
    def back_track(self, nums, track_list, used_pos):
        if len(track_list) == len(nums):
            self.res.append(track_list.copy())
        
        for idx in range(len(nums)):
            if used_pos[idx]:
                continue
            
            # 做选择
            track_list.append(nums[idx])
            used_pos[idx] = True
            
            self.back_track(nums, track_list, used_pos)
            
            # 撤销选择
            track_list.pop(-1)
            used_pos[idx] = False


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.permute([1, 2, 3]))
