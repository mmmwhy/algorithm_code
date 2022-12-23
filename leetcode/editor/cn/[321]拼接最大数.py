from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def merge_list(self, nums1: List[int], nums2: List[int]):
        res = []
        while nums1 or nums2:
            if nums1 > nums2:
                res.append(nums1.pop(0))
            else:
                res.append(nums2.pop(0))
        
        return res
    
    def remove_k_digits(self, nums: List[int], remain: int) -> List[int]:
        assert len(nums) >= remain, "保留的数量不应超过 nums 的长度"
        
        k = len(nums) - remain
        queue = []
        for num in nums:
            while queue and queue[-1] < num and k:
                queue.pop()
                k -= 1
            queue.append(num)
        return queue[:remain]
    
    def maxNumber(self, nums1: List[int], nums2: List[int], k: int) -> List[int]:
        res = []
        for part_remain in range(k + 1):
            if part_remain <= len(nums1) and (k - part_remain) <= len(nums2):
                part1 = self.remove_k_digits(nums1, part_remain)
                part2 = self.remove_k_digits(nums2, k - part_remain)
                
                merge = self.merge_list(part1, part2)
                res.append(merge)
        
        return max(res)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.maxNumber([6, 7], [6, 0, 4], 5), [6, 7, 6, 0, 4])
    print(solution.maxNumber([8, 1, 8, 8, 6], [4], 2), [8, 8])
    print(solution.maxNumber([3, 9], [8, 9], 3), [9, 8, 9])
    print(solution.maxNumber([3, 4, 6, 5], [9, 1, 2, 5, 8, 3], 5), [9, 8, 6, 5, 3])
