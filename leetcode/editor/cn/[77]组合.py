from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def __init__(self):
        self.res = []
        self.track_list = []
    
    def combine(self, n: int, k: int) -> List[List[int]]:
        self.back_track(n, 1, k)
        return self.res
    
    def back_track(self, n, start, k):
        if len(self.track_list) == k:
            self.res.append(self.track_list.copy())
        for idx in range(start, n + 1):
            # 做选择
            self.track_list.append(idx)
            self.back_track(n, idx + 1, k)
            self.track_list.pop(-1)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.combine(4, 2))
    print(solution.combine(1, 1))
