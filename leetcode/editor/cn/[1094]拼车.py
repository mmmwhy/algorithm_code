from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def carPooling(self, trips: List[List[int]], capacity: int) -> bool:
        max_to = max([trip[2] for trip in trips])
        diff_list = [0] * max_to
        
        for trip in trips:
            # 开始位置是 0
            diff_list[trip[1]] += trip[0]
            if trip[2] < max_to:
                diff_list[trip[2]] -= trip[0]
        
        res = [diff_list[0]]
        for idx in range(1, max_to):
            res.append(res[-1] + diff_list[idx])
        return max(res) <= capacity


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.carPooling([[9, 0, 1], [3, 3, 7]], 4), False)
    print(solution.carPooling([[2, 1, 5], [3, 5, 7]], 3), True)
    print(solution.carPooling([[2, 1, 5], [3, 3, 7]], 5), True)
    print(solution.carPooling([[2, 1, 5], [3, 3, 7]], 4), False)
