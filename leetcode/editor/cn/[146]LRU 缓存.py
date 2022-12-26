# leetcode submit region begin(Prohibit modification and deletion)
class Node:
    # 普通的链表节点
    def __init__(self, key: int = 0, val: int = 0):
        self.key = key
        self.val = val
        
        self.next = None
        self.prev = None


class DoubleListNode:
    # 双向节点
    def __init__(self):
        # head 和 tail 是虚拟的节点
        self.head = Node(0, 0)
        self.tail = Node(0, 0)
        self.head.next = self.tail
        self.tail.prev = self.head
        self.size = 0
    
    def add_first(self, new_node: Node):
        # 在我们的定义中，越靠前的元素越新
        new_node.next = self.head.next
        new_node.prev = self.head
        
        self.head.next.prev = new_node
        self.head.next = new_node
        
        self.size += 1
    
    def remove(self, node: Node):
        node.next.prev = node.prev
        node.prev.next = node.next
        
        node.prev = None
        node.next = None
        
        self.size -= 1
    
    def remove_last(self):
        # 队列满，移除尾部节点
        if self.head.next == self.tail:
            # 此时没有节点
            return None
        
        last_node = self.tail.prev
        self.remove(last_node)
        return last_node


class LRUCache:
    
    def __init__(self, capacity: int):
        self.map = {}
        self.cache = DoubleListNode()
        self.cap = capacity
    
    def get(self, key: int) -> int:
        if key not in self.map:
            return -1
        else:
            self.make_recently(key)
            return self.map[key].val
    
    def put(self, key: int, value: int) -> None:
        
        if key in self.map:
            # 也许是更新 key 对应的 value
            self.delete_key(key)
            self.add_recently(key, value)
        else:
            # 不存在，需要新增
            if self.cache.size == self.cap:
                self.remove_least_recent()
            
            self.add_recently(key, value)
    
    def make_recently(self, key):
        temp_node = self.map[key]
        self.cache.remove(temp_node)
        self.cache.add_first(temp_node)
    
    def add_recently(self, key, value):
        temp = Node(key, value)
        self.cache.add_first(temp)
        self.map[key] = temp
    
    def delete_key(self, key):
        temp_node = self.map[key]
        self.cache.remove(temp_node)
        del self.map[key]
    
    def remove_least_recent(self):
        last_node = self.cache.remove_last()
        del self.map[last_node.key]


# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)
# leetcode submit region end(Prohibit modification and deletion)


if __name__ == "__main__":
    cache = LRUCache(2)
    
    # 定义双向链表， 表头为最近使用的元素， 表尾是最久使用的元素
    cache.put(1, 1)  # {1:1}
    cache.put(2, 2)  # {2:2, 1:1}
    assert cache.get(1) == 1  # {1:1,2:2}
    cache.put(3, 3)  # {3:3, 1:1}, 2:2 挤出去了
    assert cache.get(2) == -1  # 没有结果
    cache.put(4, 4)  # {4:4,3:3}
    assert cache.get(1) == -1  # 没有结果
    assert cache.get(3) == 3  # {3:3,4:4}
    assert cache.get(4) == 4  # {4:4,3:3}
