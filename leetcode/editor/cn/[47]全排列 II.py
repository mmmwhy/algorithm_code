# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.res = []
    
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        self.back_track(nums, [], [False] * len(nums))
        return self.res
    
    def back_track(self, nums, track_list, used_pos):
        if len(track_list) == len(nums):
            if track_list not in self.res:
                self.res.append(track_list.copy())
        
        for idx in range(len(nums)):
            if used_pos[idx]:
                continue
            if idx > 0 and nums[idx] == nums[idx - 1] and not used_pos[idx - 1]:
                # 如果前面的相邻相等元素没有用过(说明一会走)，则跳过
                continue
            # 进行选择
            track_list.append(nums[idx])
            used_pos[idx] = True
            
            self.back_track(nums, track_list, used_pos)
            # 取消选择
            del track_list[-1]
            used_pos[idx] = False

# leetcode submit region end(Prohibit modification and deletion)
