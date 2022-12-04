from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        res = [[0 for _ in range(n)] for _ in range(n)]
        upper_bound, lower_bound = 0, n - 1
        left_bound, right_bound = 0, n - 1
        
        value = 1
        while value <= n * n:
            if upper_bound <= lower_bound:
                for j in range(left_bound, right_bound + 1):
                    res[upper_bound][j] = value
                    value += 1
                upper_bound += 1
            
            if left_bound <= right_bound:
                for i in range(upper_bound, lower_bound + 1):
                    res[i][right_bound] = value
                    value += 1
                right_bound -= 1
            
            if upper_bound <= lower_bound:
                # [right_bound, left_bound)
                for j in range(right_bound, left_bound - 1, -1):
                    res[lower_bound][j] = value
                    value += 1
                lower_bound -= 1
            
            if left_bound <= right_bound:
                for i in range(lower_bound, upper_bound - 1, -1):
                    res[i][left_bound] = value
                    value += 1
                left_bound += 1
        
        return res
    # leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.generateMatrix(5))
