class Node:
  def __init__(self, data, prev_node=None, next_node=None):
    self.data = data
    self.prev_node = prev_node
    self.next_node = next_node

class DoublyLinkedList:
  def __init__(self, val, head=None, tail=None):
    self.head = head
    self.tail = tail
    self.add(val)
    

  def add(self, val):
    new_node = Node(val)
    if self.head is None:
      self.head = new_node
    elif self.tail is None:
      self.tail = new_node
      self.tail.prev_node = self.head
      self.head.next_node = self.tail
    else:
      prev = self.tail
      prev.next_node = new_node
      self.tail = new_node

  def traverse(self):
    current = self.head

    while current.next_node:
      print(current.data)
      current = current.next_node

    print(current.data)


class LRU:
  def __init__(self, capacity):
    self.data_to_node_hash = {}
    self.capacity = capacity
    self.head = None
    self.tail = None

  def put(self, val):

    print("---------- ")
    print(val)
    print(self.data_to_node_hash)
    if val in self.data_to_node_hash:
      print(".....oh no.....")
      self.remove_from_cache(self.data_to_node_hash[val])
    else:
      if len(self.data_to_node_hash) >= self.capacity:
        self.remove_from_cache(self.head)

    self.add(val)


  def add(self, val):
    new_node = Node(val)
    if self.head is None:
      self.head = new_node
    elif self.tail is None:
      self.tail = new_node
      self.tail.prev_node = self.head
      self.head.next_node = self.tail
    else:
      prev = self.tail
      prev.next_node = new_node
      self.tail = new_node

    self.data_to_node_hash[val] = new_node

  def remove_from_cache(self, node_to_remove):
    current_node = node_to_remove
    prev_node = current_node.prev_node
    next_node = current_node.next_node


    print("=======remove_from_cache====================")
    print(current_node)
    print(prev_node)
    print(next_node)
    print("=======remove_from_cache=====ff===============")



    if prev_node:
      prev_node.next_node = next_node
    else:
      self.head = next_node


    if next_node:
      next_node.prev_node = prev_node
    else:
      self.tail = prev_node

    del(self.data_to_node_hash[node_to_remove.data])

  def traverse(self):
    current = self.head

    while current.next_node:
      print(current.data)
      current = current.next_node

    print(current.data)



lru = LRU(5)
lru.put(1)
lru.put(2)
lru.put(3)
lru.put(1)
lru.put(4)
lru.put(5)
lru.put(6)
print("--------------------------------")
print(lru.head.data)
print(lru.tail.data)
print("======fff")
lru.traverse()



# ddl = DoublyLinkedList(10)

# ddl.add(15)
# ddl.add(17)
# ddl.add(19)
# ddl.add(11)
# ddl.add(2)

# ddl.traverse()


