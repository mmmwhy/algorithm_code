from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    
    def partition(self, nums: List[int], left: int, right: int) -> int:
        # 前闭后闭，左右都是可以取到的
        pivot = nums[right]
        i = left - 1
        for j in range(left, right):
            if nums[j] < pivot:
                i += 1
                nums[i], nums[j] = nums[j], nums[i]
        nums[i + 1], nums[right] = nums[right], nums[i + 1]
        return i + 1
    
    def findKthLargest(self, nums: List[int], k: int) -> int:
        # 第 2 大，也就是第 5 小，对应从小到大排序的第 4 位
        k_1 = len(nums) - k
        left, right = 0, len(nums) - 1
        
        while left <= right:
            # 变形的快排
            pivot_pos = self.partition(nums, left, right)
            if pivot_pos < k_1:
                left = pivot_pos + 1
            elif pivot_pos > k_1:
                right = pivot_pos - 1
            else:
                return nums[pivot_pos]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.findKthLargest([3, 2, 1, 5, 6, 4], 2))
    print(solution.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4))
    print(solution.findKthLargest([1], 1))
