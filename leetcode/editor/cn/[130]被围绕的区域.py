from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def solve(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        m, n = len(board), len(board[0])
        self.extra_o = [[False for _ in range(n)] for _ in range(m)]
        for i in range(m):
            for j in [0, n - 1]:
                if board[i][j] == "O" and not self.extra_o[i][j]:
                    # 为 "O" + 没有访问过 + 不是额外的 O
                    self.traverse(board, i, j)
        
        for j in range(n):
            for i in [0, m - 1]:
                if board[i][j] == "O" and not self.extra_o[i][j]:
                    # 为 "O" + 没有访问过 + 不是额外的 O
                    self.traverse(board, i, j)
        
        # board 中将 self.extra_o 的位置给填上
        for i in range(m):
            for j in range(n):
                if board[i][j] == "O" and not self.extra_o[i][j]:
                    # board 内是 O，但是 extra_o 内是 False
                    board[i][j] = "X"
    
    def traverse(self, board, i, j):
        if self.extra_o[i][j]:
            return
        self.extra_o[i][j] = True
        if i - 1 >= 0 and board[i - 1][j] == "O":
            self.traverse(board, i - 1, j)
        
        if i + 1 <= len(board) - 1 and board[i + 1][j] == "O":
            self.traverse(board, i + 1, j)
        
        if j - 1 >= 0 and board[i][j - 1] == "O":
            self.traverse(board, i, j - 1)
        
        if j + 1 <= len(board[0]) - 1 and board[i][j + 1] == "O":
            self.traverse(board, i, j + 1)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    board = [["O", "O"], ["O", "O"]]
    solution.solve(board)
    print(board)
