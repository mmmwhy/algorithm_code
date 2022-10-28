from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution:
    def trap_force(self, height: List[int]) -> int:
        """
        对于每一列，考虑左边最高和右边最高列中，较低列 与 cur 的差：
        1、较低的列 大于 cur 的高度，那么可以放下的水为较低列高度-cur高度
        2、如果较低的列高度 与 cur 的高度一致或小于，那么放不下水。
        耗时为 n^2, 看起来 ac 不了
        """
        water_count = 0
        # cur 表示当前位置
        for cur in range(1, len(height) - 1):
            left_height = max(height[:cur]) if cur > 0 else -1
            right_height = max(height[cur + 1:])
            
            # 左右墙中较低的那个
            low_height = min(left_height, right_height)
            if low_height > height[cur]:
                water_count += low_height - height[cur]
        return water_count
    
    def trap(self, height: List[int]) -> int:
        # 考虑没必要左右都穷举来计算
        n = len(height)
        left_height = [0] * n
        right_height = [0] * n
        
        # 用 2n 的时间，填满整个表
        for idx, column_height in enumerate(height):
            if idx == 0 or column_height > left_height[idx - 1]:
                left_height[idx] = column_height
            else:
                left_height[idx] = left_height[idx - 1]
        
        idx = n - 1
        while idx >= 0:
            column_height = height[idx]
            if idx == n - 1 or column_height > right_height[idx + 1]:
                right_height[idx] = column_height
            else:
                right_height[idx] = right_height[idx + 1]
            idx -= 1
        
        # 开始单独看每一列了
        water_count = 0
        # cur 表示当前位置
        for cur in range(1, len(height) - 1):
            # 左右墙中较低的那个
            low_height = min(left_height[cur], right_height[cur])
            if low_height > height[cur]:
                water_count += low_height - height[cur]
        return water_count


# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    solution = Solution()
    import time
    
    start = time.time()
    print(solution.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
    print(time.time() - start)
