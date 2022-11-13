from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution2:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        res_list = [[], [nums[0]]]
        for idx in range(1, len(nums)):
            temp_res_list = res_list.copy()
            for res in res_list:
                temp = sorted(res + [nums[idx]])
                if temp not in temp_res_list:
                    temp_res_list.append(temp)
            res_list = temp_res_list.copy()
        return res_list


class Solution:
    def __init__(self):
        self.res = []
        self.track_list = []
    
    def subsets(self, nums: List[int]) -> List[List[int]]:
        self.back_track(nums, 0)
        return self.res
    
    def back_track(self, nums, start):
        self.res.append(self.track_list.copy())
        for idx in range(start, len(nums)):
            if idx != start and nums[idx] == nums[idx - 1]:
                continue
            # 做选择
            self.track_list.append(nums[idx])
            self.back_track(nums, idx + 1)
            
            # 撤销选择
            self.track_list.pop(-1)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.subsets([1, 2, 2]))
    print(solution.subsets([0]))
