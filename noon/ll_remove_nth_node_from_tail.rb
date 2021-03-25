class Node

  attr_accessor :data, :next_node

  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end

end

class LinkedList

  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def add(data)
    new_node = Node.new(data)
    if !@head
      @head = new_node
    else
      current_node = @head

      while current_node.next_node
        current_node = current_node.next_node
      end

      current_node.next_node = new_node
    end
  end

  def remove
    @head = @head.next_node
  end


  def remove_nth_from_end(head, n)
    current_node = head
    
    if n == 1 && !current_node.next
        head = nil
        return head
    end
    
    total_len = 1

    while current_node.next
      current_node = current_node.next
      total_len += 1
    end

    position_to_remove = total_len - n
    
    if position_to_remove > 0

        len = 1
        current_node = head
        while current_node.next


          if len == position_to_remove
            if current_node.next.next
              current_node.next = current_node.next.next
            else
              current_node.next = nil
            end
            break
          end

          current_node = current_node.next
          len += 1
        end
    else
        head = head.next
    end
    
    head
  end

end
