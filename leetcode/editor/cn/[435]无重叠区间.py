import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        # 根据结束时间，从大到小降序排列
        sorted_intervals = sorted(intervals, key=lambda x: x[1])
        
        count = 0
        
        end_interval = -math.inf
        for interval in sorted_intervals:
            start, end = interval
            # 当前元素的开始位置，在上一个元素的结束位置后
            if start >= end_interval:
                end_interval = end
                count += 1
        
        return len(intervals) - count


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [1, 3]]))
    print(solution.eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]]))
    print(solution.eraseOverlapIntervals([[1, 2], [2, 3]]))
    print(solution.eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [-100, -2], [5, 7]]))
