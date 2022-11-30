from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def corpFlightBookings(self, bookings: List[List[int]], n: int) -> List[int]:
        diff_list = [0 for _ in range(n)]
        
        for book in bookings:
            # 因为 book 的 index 是从 1 开始的，所以整体右移
            diff_list[book[0] - 1] += book[2]
            if book[1] < n:
                diff_list[book[1]] -= book[2]
        
        res = [diff_list[0]]
        for idx in range(1, n):
            res.append(res[-1] + diff_list[idx])
        return res


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.corpFlightBookings([[2, 3, 30], [2, 3, 45], [2, 3, 15], [1, 3, 15]], 4), [15, 105, 105, 0])
    print(solution.corpFlightBookings([[1, 2, 10], [2, 2, 15]], 2), [10, 25])
    print(solution.corpFlightBookings([[1, 2, 10], [2, 3, 20], [2, 5, 25]], 5), [10, 55, 45, 25, 25])
