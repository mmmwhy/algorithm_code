import random
from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution33:
    def partition(self, nums, left, right):
        pivot = nums[left]
        i, j = left + 1, right
        while i <= j:
            while i < right and nums[i] < pivot:
                i += 1
            while j > left and nums[j] > pivot:
                j -= 1
            
            if i >= j:
                break
            
            nums[i], nums[j] = nums[j], nums[i]
        # 最后将 pivot 放到该放的位置上
        nums[left], nums[j] = nums[j], nums[left]
        return j
    
    def sort(self, nums, left, right):
        if right <= left:
            return
            # 实现 left, right 范围内的排序
        p = self.partition(nums, left, right)
        self.sort(nums, left, p - 1)
        self.sort(nums, p + 1, right)
    
    def sortArray(self, nums: List[int]) -> List[int]:
        # 实现一个快速排序
        random.shuffle(nums)
        self.sort(nums, 0, len(nums) - 1)
        return nums


class Solution1:
    def partition(self, nums, left, right):
        pivot = nums[right]
        i, j = left, left
        while j < right:
            if nums[j] < pivot:
                nums[i], nums[j] = nums[j], nums[i]
                i += 1
            j += 1
        nums[i], nums[right] = nums[right], nums[i]
        return i
    
    def sort(self, nums, left, right):
        if right <= left:
            return
            # 实现 left, right 范围内的排序
        p = self.partition(nums, left, right)
        self.sort(nums, left, p - 1)
        self.sort(nums, p + 1, right)
    
    def sortArray(self, nums: List[int]) -> List[int]:
        
        # 实现一个快速排序
        self.sort(nums, 0, len(nums) - 1)
        return nums


class Solution5:
    def quick_sort(self, nums, left, right):
        flag = nums[random.randint(left, right)]
        i, j = left, right
        while i < j:
            while nums[i] < flag: i += 1
            while nums[j] > flag: j -= 1
            
            if i <= j:
                nums[i], nums[j] = nums[j], nums[i]
                i += 1
                j -= 1
        if i < right: self.quick_sort(nums, i, right)
        if j > left: self.quick_sort(nums, left, j)
    
    def sortArray(self, nums: List[int]) -> List[int]:
        # 实现一个快速排序
        self.quick_sort(nums, 0, len(nums) - 1)
        return nums


class Solution3:
    def sortArray(self, nums: List[int]) -> List[int]:
        import random  # 导入随机数函数库
        def quicksort(nums, left, right):
            flag = nums[random.randint(left, right)]  # 随机初始化哨兵位置
            i, j = left, right  # 设定从左到右的指针i，从右到左的指针j
            while i <= j:
                while nums[i] < flag: i += 1  # i从左往右扫，找到大于等于flag的数。
                while nums[j] > flag: j -= 1  # j从右往左扫，找到小于等于flag的数。
                if i <= j:
                    nums[i], nums[j] = nums[j], nums[i]  # 交换左右指针下标对应的数值
                    i += 1  # 左指针继续往右走
                    j -= 1  # 右指针继续往左走
            if i < right: quicksort(nums, i, right)  # 递归解决flag左边的低位数组的排序
            if j > left:  quicksort(nums, left, j)  # 递归解决flag右边的低位数组的排序
        
        quicksort(nums, 0, len(nums) - 1)  # 函数入口，将整个数组的信息传入
        return nums  # 返回修改后的nums


class Solution4:
    
    def sortArray(self, nums: List[int]) -> List[int]:
        if len(nums) == 1:
            return nums
        
        mid = len(nums) // 2
        left_list = self.sortArray(nums[:mid])
        right_list = self.sortArray(nums[mid:])
        
        res = []
        left_idx = 0
        right_idx = 0
        left_count = len(left_list)
        right_count = len(right_list)
        
        while left_idx < left_count and right_idx < right_count:
            if left_list[left_idx] < right_list[right_idx]:
                res.append(left_list[left_idx])
                left_idx += 1
            else:
                res.append(right_list[right_idx])
                right_idx += 1
        
        if left_idx < left_count:
            res.extend(left_list[left_idx:])
        
        if right_idx < right_count:
            res.extend(right_list[right_idx:])
        
        return res


class Solution:
    def merge_sort(self, nums, l, r):
        # 两侧都是闭合的
        if l == r:
            return
        mid = (l + r) // 2
        self.merge_sort(nums, l, mid)
        self.merge_sort(nums, mid + 1, r)
        
        result = []
        left_idx, right_idx = l, mid + 1
        while left_idx <= mid or right_idx <= r:
            if l <= left_idx <= mid < right_idx <= r:
                # 正常范围内的
                if nums[left_idx] < nums[right_idx]:
                    result.append(nums[left_idx])
                    left_idx += 1
                else:
                    result.append(nums[right_idx])
                    right_idx += 1
            elif left_idx > mid:
                # 左半边全合并了，只有右半边了
                result.append(nums[right_idx])
                right_idx += 1
            elif right_idx > r:
                # 右半边全合并了，只有左半边了
                result.append(nums[left_idx])
                left_idx += 1
        
        nums[l: r + 1] = result
    
    def sortArray(self, nums: List[int]) -> List[int]:
        self.merge_sort(nums, 0, len(nums) - 1)
        return nums


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.sortArray([3, 2, 3, 1, 2, 4, 5, 5, 6]))
    print(solution.sortArray([5, 2, 3, 1]))
    print(solution.sortArray([5, 1, 1, 2, 0, 0]))
    print(solution.sortArray([-2, 3, -5]))
    print(solution.sortArray([2] * 50000))
