# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def removeKdigits(self, num: str, k: int) -> str:
        """
        后边的数进入后：
        1、如果进入的数比前边的数小，则弹出前边的数；
        2、否则正常插入
        3、极端情况下，单调递增，则取前 [:len(num)-k] 的结果
        """
        queue = []
        remain = len(num) - k
        for c in num:
            while queue and queue[-1] > c and k:
                queue.pop()
                k -= 1
            queue.append(c)
        
        queue = queue[:remain]
        if queue:
            return str(int("".join(queue)))
        else:
            return "0"


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.removeKdigits("1173", 2), 11)
    print(solution.removeKdigits("1432219", 3), 1219)
    print(solution.removeKdigits("10200", 1), 200)
    print(solution.removeKdigits("10", 2), 0)
