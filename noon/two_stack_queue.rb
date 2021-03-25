class Queue

  attr_accessor :queue, :len

  def initialize
    @queue = []
    @len = 0
  end

  def add(ele)
    @queue << ele
    @len += 1
  end

  def remove
    @queue.shift
    @len -= 1 if @len > 0
  end

  def front
    @queue[0]
  end

  def rear
    @queue[@len-1]
  end
  
end



class Stack
  attr_accessor :top, :stack, :len

  def initialize
    @stack = []
    @len = 0
  end

  def push(ele)
    @stack << ele
    @len += 1
  end

  def pop
    @stack.pop
    @len -= 1 if @len > 0
  end

  def top
    @stack[@len-1]
  end
end

class TwoSctackQueue
  attr_accessor :queue, :len

  def initialize
    @stack_1 = Stack.new
    @stack_2 = Stack.new
  end

  def put(ele)
    @stack_1.push(ele)
  end

  def pop
    if @stack_2.len > 0
      @stack_2.pop
    elsif @stack_1.len > 0
      @stack_1.len.times do
        @stack_2.push(@stack_1.top)
        @stack_1.pop
      end
      @stack_2.pop
    end
  end

  def peek
    if @stack_2.len > 0
      @stack_2.top
    else
      @stack_1.len.times do
        @stack_2.push(@stack_1.top)
        @stack_1.pop
      end

      @stack_2.top
    end
  end

  def rear
    @stack_1.top
  end
end



fptr = File.open(ENV['OUTPUT_PATH'], 'w')
q = TwoSctackQueue.new

t = gets.to_i

t.times do |t_itr|
    str = gets.to_s.split(' ').map(&:to_i)
    s = str[0]
    val = str[1]

    case s
    when 1
      q.put(val)
    when 2
      q.pop
    when 3
      p q.peek
    end
      

    fptr.write result
    fptr.write "\n"
end

fptr.close()



