from collections import defaultdict
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def advantageCount(self, nums1: List[int], nums2: List[int]) -> List[int]:
        n = len(nums1)
        # 按降序排列
        sorted_nums1 = sorted(nums1, reverse=True)
        sorted_nums2 = sorted(nums2, reverse=True)
        
        mapping = defaultdict(list)
        for i in range(n):
            mapping[nums2[i]].append(i)
        
        # nums1 中 left 是当前区间最小值， right 是当前区间最大值
        left, right = 0, n - 1
        res = [0] * n
        
        for n2 in sorted_nums2:
            if sorted_nums1[left] > n2:
                target = sorted_nums1[left]
                left += 1
            else:
                target = sorted_nums1[right]
                right -= 1
            
            res[mapping[n2].pop()] = target
        return res


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.advantageCount([12, 24, 8, 32], [13, 25, 32, 11]), [24, 32, 8, 12])
    print(solution.advantageCount(
            [8, 2, 4, 4, 5, 6, 6, 0, 4, 7],
            [0, 8, 7, 4, 4, 2, 8, 5, 2, 0]),
            [4, 7, 8, 6, 5, 4, 0, 6, 4, 2])
    
    print(solution.advantageCount([0], [5]), [0])
    print(solution.advantageCount([2, 7, 11, 15], [1, 10, 4, 11]), [2, 11, 7, 15])
