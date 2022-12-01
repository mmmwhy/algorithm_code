from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        import copy
        old_matrix = copy.deepcopy(matrix)
        # 提示中已说明 m,n 一致
        n = len(old_matrix)
        
        for j in range(n):
            # 固定第一列
            for i in range(n):
                # 逆序遍历每一行
                matrix[j][i] = old_matrix[n - 1 - i][j]


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
    solution.rotate(matrix)
    print(matrix)
