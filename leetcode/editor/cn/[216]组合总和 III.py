from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        
        self.res = []
        nums = list(range(1, 10))
        used_value = {i: False for i in range(1, 10)}
        
        self.back_track(k, nums, 0, [], 0, used_value, n)
        
        return self.res
    
    def back_track(self, k, nums, start, track_list, track_sum, used_value, target_num):
        if len(track_list) > k:
            return
        
        if track_sum == target_num and len(track_list) == k:
            self.res.append(track_list.copy())
            return
        
        if start == len(nums) or used_value[nums[start]]:
            return
        
        for idx in range(start, len(nums)):
            # 跳过 case
            if track_sum + nums[idx] > target_num:
                # 后边会越来越大
                break
            
            # 做选择
            used_value[nums[idx]] = True
            track_list.append(nums[idx])
            track_sum += nums[idx]
            
            self.back_track(k, nums, idx + 1, track_list, track_sum,
                            used_value, target_num)
            
            # 撤销选择
            used_value[nums[idx]] = False
            track_list.pop(-1)
            track_sum -= nums[idx]
        
        # leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.combinationSum3(9, 45), "[[1,2,3,4,5,6,7,8,9]]")
