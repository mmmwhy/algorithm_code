from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        length = len(nums)
        if not nums or length < 3:
            return []

        # 确保结果有序
        nums = sorted(nums)
        result = []
        for i in range(len(nums) - 2):
            # 后续均大于 0
            if nums[i] > 0:
                return result

            # 细节的可以跳过的地方
            if i > 0 and nums[i] == nums[i-1]:
                continue

            j = i + 1
            k = length - 1
            while j < k:
                if nums[i] + nums[j] + nums[k] > 0:
                    k -= 1

                elif nums[i] + nums[j] + nums[k] < 0:
                    j += 1

                elif nums[i] + nums[j] + nums[k] == 0:
                    if [nums[i], nums[j], nums[k]] not in result:
                        result.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1

        return result


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.threeSum(nums=[-1, 0, 1, 2, -1, -4, -2, -3, 3, 0, 4]))
    print(solution.threeSum(nums=[3, 0, -2, -1, 1, 2]))
    print(solution.threeSum(nums=[-1, 0, 1, 2, -1, -4]))
    print(solution.threeSum(nums=[0, 1, 1]))
    print(solution.threeSum(nums=[0, 0, 0]))
