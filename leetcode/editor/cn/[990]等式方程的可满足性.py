from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class UnionFind:
    def __init__(self, char_list):
        self.parent = {}
        for char in char_list:
            self.parent[char] = char
    
    def connect(self, char1, char2):
        char1_root = self.find_parent(char1)
        char2_root = self.find_parent(char2)
        
        self.parent[char1_root] = char2_root
    
    def find_parent(self, char):
        if self.parent[char] != char:
            self.parent[char] = self.find_parent(self.parent[char])
        return self.parent[char]
    
    def is_connect(self, char1, char2):
        char1_parent = self.find_parent(char1)
        char2_parent = self.find_parent(char2)
        return char1_parent == char2_parent


class Solution:
    def equationsPossible(self, equations: List[str]) -> bool:
        char_set = set()
        
        for pair in equations:
            char_set.add(pair[0])
            char_set.add(pair[-1])
        uf = UnionFind(list(char_set))
        
        # 构造关系
        for pair in equations:
            if "==" in pair:
                uf.connect(pair[0], pair[-1])
        
        # 开始验证
        flag = True
        for pair in equations:
            if "!=" in pair:
                if uf.is_connect(pair[0], pair[-1]):
                    flag = False
        return flag


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.equationsPossible(["a==b", "b!=c", "c==a"]), False)
    print(solution.equationsPossible(["e==e", "d!=e", "c==d", "d!=e"]), True)
    print(solution.equationsPossible(["e!=c", "b!=b", "b!=a", "e==d"]), False)
    print(solution.equationsPossible(["a!=a"]), False)
    print(solution.equationsPossible(["a==a"]), True)
    print(solution.equationsPossible(["a==b"]), True)
    print(solution.equationsPossible(["a!=b"]), True)
    print(solution.equationsPossible(["a==b", "b!=a"]), False)
    print(solution.equationsPossible(["b==a", "a==b"]), True)
    print(solution.equationsPossible(["a==b", "b==c", "a==c"]), True)
    print(solution.equationsPossible(["c==c", "b==d", "x!=z"]), True)
