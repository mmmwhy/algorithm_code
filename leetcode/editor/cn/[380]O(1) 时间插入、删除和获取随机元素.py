# leetcode submit region begin(Prohibit modification and deletion)
class RandomizedSet:
    
    def __init__(self):
        self.value_2_index = {}
        self.value_list = []
    
    def insert(self, val: int) -> bool:
        if val in self.value_2_index:
            return False
        else:
            self.value_2_index[val] = len(self.value_list)
            self.value_list.append(val)
            return True
    
    def remove(self, val: int) -> bool:
        if val not in self.value_2_index:
            return False
        else:
            index = self.value_2_index[val]
            
            self.value_2_index[self.value_list[-1]] = index
            
            self.value_list[index], self.value_list[-1] = self.value_list[-1], self.value_list[index]
            
            self.value_list.pop(-1)
            self.value_2_index.pop(val)
            return True
    
    def getRandom(self) -> int:
        import random
        return random.choice(self.value_list)


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()
# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = RandomizedSet()
    print(solution.insert(1))
    print(solution.remove(2))
    print(solution.insert(2))
    print(solution.getRandom())
    print(solution.remove(1))
    print(solution.insert(2))
    print(solution.getRandom())
