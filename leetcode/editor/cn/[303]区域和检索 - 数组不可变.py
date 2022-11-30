from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class NumArray:
    
    def __init__(self, nums: List[int]):
        self.nums = nums
        
        # preSum[i] 记录 nums[0..i-1] 的累加和
        self.pre_sum = [0] * (len(nums) + 1)
        for i in range(1, len(self.pre_sum)):
            self.pre_sum.append(self.pre_sum[i - 1] + nums[i - 1])
    
    def sumRange(self, left: int, right: int) -> int:
        return self.pre_sum[right + 1] - self.pre_sum[left]


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)
# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = NumArray([-2, 0, 3, -5, 2, -1])
    print(solution.sumRange(0, 2), 1)
    print(solution.sumRange(2, 5), -1)
    print(solution.sumRange(0, 5), -3)
