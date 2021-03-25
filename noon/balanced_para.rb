# class Stack

#   def initialize(arr=[])
#     @stack = arr
#   end

#   def push(ele)
#     @stack << ele
#   end

#   def pop
#     @stack.pop
#   end

#   def is_empty?
#     @stack.size == 0
#   end

#   def peek
#     @stack.last
#   end

#   def size
#     @stack.length
#   end

#   def item
#     @stack
#   end

# end
# # Complete the isBalanced function below.
# def isBalanced(s)
#     b = { '}' => '{', ']' => '[', ')' => '(' }
#     stack = Stack.new()
#     s.split('').each do |ele|
#         if ['(', '{', '['].include? ele
#       stack.push(ele)
#     elsif ([')', '}', ']'].include? ele)
#       if (stack.peek == b[ele])
#         stack.pop
#       else
#         return "NO"
#       end
#     end  
#     end
#     if stack.is_empty?
#         "YES"
#     else
#         "NO"
#     end

# end

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


def is_balanced?(str)

  braces_hash = { '{' => '}', '[' => ']', '(' => ')', }
  openings = braces_hash.keys
  closings = braces_hash.values

  str_arr = str.split('')

  stack = Stack.new

  balanced = true

  str_arr.each do |brace|
    if braces_hash[brace]
      stack.push(brace)
    else
      opening = braces_hash.key(brace)
      if stack.top == opening
        stack.pop
      else
        balanced = false
        break
      end
    end

  end

  res = balanced && (stack.len == 0) ? "YES" : "NO"

  res
end



# p aa[15]
# aa.each do |d|
#   p is_balanced?(d)
# end
# p is_balanced?(aa[0])