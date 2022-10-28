from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        # 左指针指向当前为0的位置，右指针指向不为零的地方，交换位置
        left, right = 0, 0
        
        while right < len(nums):
            
            while left < len(nums) and nums[left] != 0:
                left += 1
            if left >= len(nums):
                break
            
            right = left + 1
            while right < len(nums) and nums[right] == 0:
                right += 1
            if right >= len(nums):
                break
            
            # 交换位置
            nums[left], nums[right] = nums[right], nums[left]
            
            left += 1


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    test = [0, 1, 0, 3, 12, 0, 1]
    solution.moveZeroes(test)
    print(test)
