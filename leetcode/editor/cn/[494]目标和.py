from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findTargetSumWaysBack(self, nums: List[int], target: int) -> int:
        self.res = []
        self.memo = {}
        self.back_track(nums, [], 0, target)
        return len(self.res)
    
    def back_track(self, nums, track_list, start, remain):
        if start == len(nums):
            if remain == 0:
                self.res.append(track_list.copy())
            return
        
        # 做选择
        track_list.append("+")
        self.back_track(nums, track_list, start + 1, remain - nums[start])
        # 撤销选择
        track_list.pop(-1)
        
        track_list.append("-")
        self.back_track(nums, track_list, start + 1, remain + nums[start])
        track_list.pop(-1)
    
    def findTargetSumWaysMemo(self, nums: List[int], target: int) -> int:
        # 消除重叠子问题
        self.memo = {}
        return self.dp(nums, 0, target)
    
    def dp(self, nums, start, remain):
        if start == len(nums):
            if remain == 0:
                return 1
            else:
                return 0
        if (start, remain) in self.memo:
            return self.memo[(start, remain)]
        else:
            result = self.dp(
                    nums, start + 1, remain - nums[start]) + self.dp(
                    nums, start + 1, remain + nums[start])
            
            return result
    
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        # sum(a) = (target + sum(nums)) / 2
        # 从 nums 中选择一组数，使其相加为 (target + sum(nums)) / 2，问，有多少种方法
        if sum(nums) < abs(target) or (sum(nums) + target) % 2 == 1:
            return 0
        
        return self.subset(nums, (sum(nums) + target) // 2)
    
    def subset(self, nums, target):
        m = len(nums)
        # 前 i 个数，填满 j 个空间的方法
        dp = [[0 for _ in range(target + 1)] for _ in range(m + 1)]
        # 前 0 个数，占满前 0 个空间的方式为1个
        dp[0][0] = 1
        
        for i in range(1, m + 1):
            for j in range(0, target + 1):
                if j - nums[i - 1] < 0:
                    dp[i][j] = dp[i - 1][j]
                else:
                    dp[i][j] = dp[i - 1][j] + dp[i - 1][j - nums[i - 1]]
        
        return dp[m][target]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.findTargetSumWays([0, 0, 0, 0, 0, 0, 0, 0, 1], 1), 1)
    print(solution.findTargetSumWays([100], -200), 0)
    print(solution.findTargetSumWays([7, 9, 3, 8, 0, 2, 4, 8, 3, 9], 0), 0)
    print(solution.findTargetSumWays([1000], -1000), 1)
    print(solution.findTargetSumWays([1, 1, 1, 1, 1], 3), 5)
