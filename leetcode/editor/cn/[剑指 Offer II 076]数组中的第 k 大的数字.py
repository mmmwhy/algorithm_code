from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def partition(self, nums, left, right):
        pivot = nums[right]
        i = left - 1
        for j in range(left, right):
            if nums[j] > pivot:
                i += 1
                nums[i], nums[j] = nums[j], nums[i]
        nums[i + 1], nums[right] = nums[right], nums[i + 1]
        return i + 1
    
    def findKthLargest(self, nums: List[int], k: int) -> int:
        k_1 = k - 1
        left, right = 0, len(nums) - 1
        
        while left <= right:
            pos = self.partition(nums, left, right)
            if pos < k_1:
                left = pos + 1
            elif pos > k_1:
                right = pos - 1
            else:
                return nums[pos]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.findKthLargest([3, 2, 1, 5, 6, 4], 2))
    print(solution.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4))
    print(solution.findKthLargest([1], 1))
