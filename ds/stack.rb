class Stack

  def initialize(arr=[])
    @stack = arr
  end

  def push(ele)
    @stack << ele
  end

  def pop
    @stack.pop
  end

  def is_empty?
    @stack.size == 0
  end

  def peek
    @stack.last
  end

  def size
    @stack.length
  end

  def item
    @stack
  end

end

def balanced?(s)
  b = { '}' => '{', ']' => '[', ')' => '(' }
  stack = Stack.new()
  s.split('').each do |ele|
    p "=-======================"
    p stack.item
    p ele
    p stack.peek
    if ['(', '{', '['].include? ele
      stack.push(ele)
    elsif ([')', '}', ']'].include? ele)
      if (stack.peek == b[ele])
        stack.pop
      else
        return false
      end
    end    
  end
  stack.is_empty?
end

def postfix(exp)
  precedence = { '+' => 1, '-' => 1, '/' => 2, '*' => 2, '^' => 3 }
  brackets = ['(', ')']
  res = []
  stack = Stack.new()
  exp.split('').each do |ele|
    if precedence.keys.include? ele
      if stack.size > 0
        p "===========999======"
        p precedence[ele]
        p precedence[stack.peek]
        p stack.peek
        while (stack.peek != '(' && (precedence[ele] <= precedence[stack.peek])) do
          val = stack.pop
          res << val
        end
      end
      
      stack.item << ele
    elsif brackets.include? ele
      if ele == ")"
        until stack.peek == '('
          val = stack.pop
          res << val
        end
        stack.pop
      else
        stack.item << ele
      end
    else
      res << ele
    end 

    p "=================="
    p ele
    p stack.item
    p res
  end

  res
end


# res = balanced?('{(([])[])[]]}')
# puts res

res = postfix('(A+B)*C-(D-E)*(F+G)')
puts res