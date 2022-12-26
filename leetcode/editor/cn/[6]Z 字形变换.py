# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def convert(self, s: str, numRows: int) -> str:
        new_str_metric = [["" for _ in range(len(s))] for _ in range(numRows)]
        
        # 向下的部分
        old_str_index = 0
        
        new_str_row = 0
        new_str_column = 0
        
        while old_str_index < len(s):
            for i in range(numRows):
                if old_str_index == len(s):
                    break
                
                new_str_metric[new_str_row][new_str_column] = s[old_str_index]
                
                old_str_index += 1
                new_str_row += 1
            
            # 斜着向右上方移动
            if numRows == 1:
                new_str_row -= 1
            else:
                new_str_row -= 2
            
            new_str_column += 1
            
            for i in range(numRows - 2):
                if old_str_index == len(s):
                    break
                
                new_str_metric[new_str_row][new_str_column] = s[old_str_index]
                
                new_str_row -= 1
                new_str_column += 1
                old_str_index += 1
        
        new_str = ""
        
        for i in range(numRows):
            for j in range(len(s)):
                if new_str_metric[i][j] != "":
                    new_str += new_str_metric[i][j]
        return new_str


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.convert("ABC", 1), "ABC")
    print(solution.convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
    print(solution.convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
    print(solution.convert("A", 1) == "A")
