from typing import List


# leetcode submit region begin(Prohibit modification and deletion)
class Solution2:
    def partition(self, nums, left, right):
        x = nums[right]
        i = left - 1
        for j in range(left, right):
            if nums[j] < x:
                i += 1
                nums[i], nums[j] = nums[j], nums[i]
        nums[i + 1], nums[right] = nums[right], nums[i + 1]
        return i + 1
    
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


class Solution:
    def merge_sort(self, nums, l, r):
        if l == r:
            return
        mid = (l + r) // 2
        self.merge_sort(nums, l, mid)
        self.merge_sort(nums, mid + 1, r)
        tmp = []
        i, j = l, mid + 1
        while i <= mid or j <= r:
            if i > mid or (j <= r and nums[j] < nums[i]):
                tmp.append(nums[j])
                j += 1
            else:
                tmp.append(nums[i])
                i += 1
        nums[l: r + 1] = tmp
    
    def sortArray(self, nums: List[int]) -> List[int]:
        self.merge_sort(nums, 0, len(nums) - 1)
        return nums


# leetcode submit region end(Prohibit modification and deletion)

if __name__ == "__main__":
    solution = Solution()
    print(solution.sortArray([5]))
    print(solution.sortArray([5, 2, 3, 1]))
    print(solution.sortArray([5, 1, 1, 2, 0, 0]))
