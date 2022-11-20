import math
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        sorted_points = sorted(points, key=lambda x: x[1])
        # 使用贪心策略计算不重叠区域
        count = 0
        end_point = -math.inf
        for point in sorted_points:
            start, end = point
            # 当前元素的开始位置，在上一个元素的结束位置后
            if start > end_point:
                count += 1
                end_point = end
        return count


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.findMinArrowShots([[10, 16], [2, 8], [1, 6], [7, 12]]))
    print(solution.findMinArrowShots([[1, 2], [3, 4], [5, 6], [7, 8]]))
    print(solution.findMinArrowShots([[1, 2], [2, 3], [3, 4], [4, 5]]))
