require 'prime'


prime_array = -> (array_size) do 
    Prime.each.lazy.select {|i| i.to_s == i.to_s.reverse}.first(array_size)
end


# p prime_array.(15)

def skip_animals(animals, skip)
  # Your code here
    result = []
    animals.each_with_index do |animal, index|
        next if index < skip
        result << "#{index}:#{animal}"
    end
    result
end
# p skip_animals(['leopard', 'bear', 'fox', 'wolf'], 2)



def rot13(secret_messages)
  # your code here
  # alphabets = ('a'..'z').to_a
  # alphabets_to_rot_13_alphabets = {"?" => "!", " " => " ", "!" => "?"}
  # alphabets.each_with_index do |a, index|
  # 	alphabets_to_rot_13_alphabets[a] = alphabets[(index+13) % 26]
  # end

  # secret_messages.map { |msg| msg.split('').map{ |letter| (alphabets_to_rot_13_alphabets[letter.downcase])}.join.capitalize }
  # secret_messages.map {|m| m.tr!("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ? ", "n-za-m")}
  secret_messages.map {|m| m.tr!("a-z", "n-za-m")}
end

# puts rot13 (["Why did the chicken cross the road?", "Gb trg gb gur bgure fvqr!"])

def sum_terms(n)
  # your code here
    (1..n).inject(&:+)
end
# puts sum_terms(3)

# Your code here
def serial_average(str)
	serial_number = str[0, 4]
    digit_1 = str[4, 5].to_f
    digit_2 = str[10, 5].to_f

    avg = "%.2f" % ((digit_1 + digit_2)/2.00).round(2)

    "#{serial_number}#{avg}"
end

# p serial_average('001-12.43-56.78')




# block
def calculate(a,b)
    yield(a, b)
end

# puts calculate(15, 10) {|a, b| a - b}   


def factorial(n)
    yield(n)
end

# n = gets.to_i
# puts factorial(n) {|n| (1..4).inject(1, :*)}  


# proc

def foo(a, b, my_proc)
    my_proc.call(a, b)
end

add = proc {|x, y| x + y}

# puts foo(15, 10, add)


# (a). Lambda that takes no arguments.

def area (l, b)
   -> { l * b } 
end

x = 10.0; y = 20.0

area_rectangle = area(x, y).call
area_triangle = 0.5 * area(x, y).()

# puts area_rectangle     #200.0
# puts area_triangle      #100.0

# (b). Lambda that takes one or more arguments.

area = ->(a, b) { a * b }

x = 10.0; y = 20.0

area_rectangle = area.(x, y)
area_triangle = 0.5 * area.call(x, y)

# puts area_rectangle     #200.0
# puts area_triangle      #100.0   



def pipeline(*funcs)
  -> (arg) {
    funcs.each do |fun|
      arg = fun.call(arg)
    end
    arg
  }
end

fund = pipeline(-> (x) { x * 3 }, -> (x) { x + 1 }, -> (x) { x / 2 })
puts fund.call(3)


def filter(students, *filters)
  result = students

  filters.each do |filter|
    result = result.select{ |r| filter.call(r) }
  end

  result
end

def square_of_sum (my_array, proc_square, proc_sum)
    sum = proc_sum.call(my_array)
    proc_square.call(sum)
end

proc_square_number = proc {|num| num * num }
proc_sum_array     = proc {|arr| arr.inject(&:+)}
my_array = gets.split().map(&:to_i)

# puts square_of_sum(my_array, proc_square_number, proc_sum_array)

combination = -> (n) do
    -> (r) do
       (n-r+1..n).inject(:*) / (1..r).inject(:*)
   end
    
end

n = gets.to_i
r = gets.to_i
# nCr = combination.(n)
# puts nCr.(r)



