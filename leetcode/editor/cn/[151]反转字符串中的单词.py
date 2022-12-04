# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def reverseWords(self, s: str) -> str:
        res = []
        
        temp = []
        for c in s:
            if c != ' ':
                temp.append(c)
            elif len(temp) > 0:
                res.insert(0, "".join(temp))
                temp.clear()
        if len(temp) > 0:
            res.insert(0, "".join(temp))
        return " ".join(res)


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.reverseWords(" ") == "")
    print(solution.reverseWords(" hello world ") == "world hello")
    print(solution.reverseWords("the sky is blue") == "blue is sky the")
    print(solution.reverseWords("a good   example") == "example good a")
