from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.res = []
    
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        nums = sorted(nums)
        self.back_track(nums, [], [False] * len(nums))
        return self.res
    
    def back_track(self, nums, track_list, used_pos):
        if len(track_list) == len(nums):
            self.res.append(track_list.copy())
        
        for idx in range(len(nums)):
            if used_pos[idx]:
                continue
            if idx > 0 and nums[idx] == nums[idx - 1] and not used_pos[idx - 1]:
                """
                若当前元素与上一个元素相同，那么从当前元素开始的回溯，应该要跳过。
                如何判断从**当前元素开始的回溯**：从当前元素开始，代表这上一个元素还未回溯到(未使用到)，可以直接跳过。
                """
                continue
            # 进行选择
            track_list.append(nums[idx])
            used_pos[idx] = True
            
            self.back_track(nums, track_list, used_pos)
            # 取消选择
            del track_list[-1]
            used_pos[idx] = False


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.permuteUnique([1, 1, 2]))
