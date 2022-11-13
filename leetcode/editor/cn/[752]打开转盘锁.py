from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def plusOne(self, target, i):
        return target[:i] + str((int(target[i]) + 1) % 10) + target[i + 1:]
    
    def minusOne(self, target, i):
        return target[:i] + str((int(target[i]) - 1) % 10) + target[i + 1:]
    
    def openLock(self, deadends: List[str], target: str) -> int:
        
        queue = ["0000"]
        
        walk = 0
        used_nums = set()
        
        while len(queue) > 0:
            queue_length = len(queue)
            
            # 所有相邻的顶点都拿出来
            for j in range(queue_length):
                cur = queue.pop(0)
                # 出口
                if cur == target:
                    return walk
                
                # 避免走死路
                if cur in deadends:
                    continue
                
                # 每个定点做一些手脚
                for i in range(4):
                    up = self.plusOne(cur, i)
                    if up not in used_nums:
                        queue.append(up)
                        used_nums.add(up)
                    
                    down = self.minusOne(cur, i)
                    if down not in used_nums:
                        queue.append(down)
                        used_nums.add(down)
            # 计算步数
            walk += 1
        
        return -1


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    deadends = ["0201", "0101", "0102", "1212", "2002"]
    target = "0202"
    print(solution.openLock(deadends, target))
