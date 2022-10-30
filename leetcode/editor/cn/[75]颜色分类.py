from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        # 这里写了个冒泡排序
        for i in range(len(nums)):
            min_j_pos = -1
            min_j_value = nums[i]
            for j in range(i + 1, len(nums)):
                if nums[j] < min_j_value:
                    min_j_value = nums[j]
                    min_j_pos = j
            
            if min_j_pos != -1:
                nums[i], nums[min_j_pos] = nums[min_j_pos], nums[i]


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    test = [1, 2]
    solution.sortColors(test)
    print(test)
    
    test = [2, 0]
    solution.sortColors(test)
    print(test)
    
    test = [2, 0, 2, 1, 1, 0]
    solution.sortColors(test)
    print(test)
    
    test = [2, 0, 1]
    solution.sortColors(test)
    print(test)
