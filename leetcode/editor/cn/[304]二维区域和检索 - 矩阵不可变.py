from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class NumMatrix:
    
    def __init__(self, matrix: List[List[int]]):
        m, n = len(matrix), len(matrix[0])
        
        # preSum[i][j] 记录 matrix[i][j] 之前的和
        self.preSum = {}
        for i in range(-1, m):
            self.preSum[i] = {}
            for j in range(-1, n):
                self.preSum[i][j] = 0
        
        for i in range(m):
            for j in range(n):
                self.preSum[i][j] = self.preSum[i - 1][j] + self.preSum[i][j - 1] \
                                    - self.preSum[i - 1][j - 1] + matrix[i][j]
    
    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:
        return self.preSum[row2][col2] - self.preSum[row2][col1 - 1] - \
               self.preSum[row1 - 1][col2] + self.preSum[row1 - 1][col1 - 1]


# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix(matrix)
# param_1 = obj.sumRegion(row1,col1,row2,col2)
# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]])
    print(solution.sumRegion(2, 1, 4, 3), 8)
    print(solution.sumRegion(1, 1, 2, 2), 11)
    print(solution.sumRegion(1, 2, 2, 4), 12)
