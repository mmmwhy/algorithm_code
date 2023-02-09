from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def findSubstring(self, s: str, words: List[str]) -> List[int]:
        # n 是字符串的长度， m 是有多少个字符串
        n, m = len(words[0]), len(words)
        window_length = n * m
        
        sorted_words = sorted(words)
        
        res = []
        for i in range(0, len(s) - window_length + 1):
            window_text = s[i:i + window_length]
            window_word = []
            for j in range(0, len(window_text), n):
                window_word.append(window_text[j:j + n])
            
            sorted_window_word = sorted(window_word)
            flag = True
            for word1, word2 in zip(sorted_words, sorted_window_word):
                if word1 != word2:
                    flag = False
            if flag:
                res.append(i)
        
        return res


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    print(solution.findSubstring(
            "lingmindraboofooowingdingbarrwingmonkeypoundcake",
            ["fooo", "barr", "wing", "ding", "wing"]), [13])
    print(solution.findSubstring("wordgoodgoodgoodbestword", ["word", "good", "best", "word"]), [])
    print(solution.findSubstring("barfoothefoobarman", ["foo", "bar"]), [0, 9])
    print(solution.findSubstring("barfoofoobarthefoobarman", ["bar", "foo", "the"]), [6, 9, 12])
