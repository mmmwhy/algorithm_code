from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.state_res_cache = {}
    
    def canPartitionKSubsets(self, nums: List[int], k: int) -> bool:
        if k > len(nums):
            return False
        
        target_num = sum(nums) // k
        if sum(nums) != target_num * k:
            return False
        
        nums = sorted(nums, reverse=True)
        return self.back_track(k, nums, 0, 0, [False] * len(nums), target_num)
    
    def back_track(self, k, nums, start, bucket, used_pos, target_num):
        """
        :param k: 桶的数量
        :param nums: 原始数组
        :param start: 数组中开始的位置
        :param bucket: 当前桶的大小
        :param used_pos: 使用过的位置
        :param target_num: 目标数量
        :return:
        """
        if k == 0:
            # 所有的桶都被装满了
            return True
        
        state = tuple(used_pos)
        
        if bucket == target_num:
            res = self.back_track(k=k - 1, nums=nums, start=0, bucket=0, used_pos=used_pos, target_num=target_num)
            self.state_res_cache[state] = res
            return res
        
        if state in self.state_res_cache:
            return self.state_res_cache[state]
        
        for idx in range(start, len(nums)):
            if used_pos[idx]:
                # 已使用
                continue
            if nums[idx] + bucket > target_num:
                # 已装满
                continue
            bucket += nums[idx]
            used_pos[idx] = True
            if self.back_track(k, nums, idx + 1, bucket, used_pos, target_num):
                return True
            bucket -= nums[idx]
            used_pos[idx] = False
        
        return False


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4))
    print(solution.canPartitionKSubsets([1, 2, 3, 4], 3))
    print(solution.canPartitionKSubsets([3, 9, 4, 5, 8, 8, 7, 9, 3, 6, 2, 10, 10, 4, 10, 2], 10))
    print(solution.canPartitionKSubsets(
            [3522, 181, 521, 515, 304, 123, 2512, 312, 922, 407, 146, 1932, 4037, 2646, 3871, 269], 5))
