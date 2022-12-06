from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    
    def __init__(self, w: List[int]):
        self.pre_sum = [w[0]]
        
        for value in w[1:]:
            self.pre_sum.append(self.pre_sum[-1] + value)
    
    @staticmethod
    def left_bound(nums, target):
        left, right = 0, len(nums) - 1
        while left <= right:
            mid = int(left + (right - left) / 2)
            if nums[mid] == target:
                right = mid - 1
            elif nums[mid] < target:
                left = mid + 1
            elif nums[mid] > target:
                right = mid - 1
        
        return left
    
    def pickIndex(self) -> int:
        import random
        target = random.randint(1, self.pre_sum[-1])
        return self.left_bound(self.pre_sum, target)


# Your Solution object will be instantiated and called as such:
# obj = Solution(w)
# param_1 = obj.pickIndex()
# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    obj = Solution([1, 3, 2, 1])
    for _ in range(50):
        print(obj.pickIndex())
