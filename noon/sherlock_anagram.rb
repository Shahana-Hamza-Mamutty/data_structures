# def generate_substrings(str)
#   str_len = str.length
#   str_arr = str.split('')
#   substrings = []
#   str_arr.each_with_index do |alpha, index|
#     n = str_len - index
#     n.times do |pos|
#       substrings << str_arr[index..(index+pos)]
#     end
#   end

#   substrings
# end

# n(n-1)/2
def sherlock(str)
  str_len = str.length
  str_arr = str.split('')
  substrings_count = {}
  result = 0
  str_arr.each_with_index do |alpha, index|
    n = str_len - index
    n.times do |pos|
      ss = str_arr[index..(index+pos)].sort.join('')
      substrings_count[ss] = substrings_count[ss] ? substrings_count[ss]+1 : 1
    end
  end

  substrings_count.each do |key, val|
    result = result + ((val*(val-1))/2) if val > 1
  end
  result
end


p sherlock("abba")


