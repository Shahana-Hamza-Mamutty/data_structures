# def length_of_longest_substring(str)

#   query_string = str.split('')
#   pos_hash = {}
#   max_len = 0
#   n = 0

#   query_string.each_with_index do |val, index|
#     if pos_hash[val]
#       pos_hash.delete_if{ |k, v| (pos_hash[val] && v <= pos_hash[val])}
#       pos_hash[val] = index
#       n = pos_hash.length
#     else
#       pos_hash[val] = index
#       n = n + 1
#     end
#     max_len = n if n > max_len
#   end

#   max_len

# end


# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 1 if s.length == 1
  string_array = s.split('')
  index_hash = {}
  max_ss_len = 0
  string_array.each_with_index do |val, index|
     if index_hash[val] && index_hash[val] == index
      next
     end
    i = index

    while(index_hash[string_array[i]].nil? && (i <= (string_array.length - 1) ))

      index_hash[string_array[i]] = i
      i += 1
    end 


    max_ss_len = index_hash.length if index_hash.length > max_ss_len

    if(i <= (string_array.length - 1))

      nodes_to_del = index_hash[string_array[i]]

      index_hash.delete_if{ |k, v| v <= nodes_to_del}

      index_hash[string_array[i]] = i 
    end

    break if i >= (string_array.length - 1) 
    
  end

  max_ss_len
    
end


p length_of_longest_substring("pwwkew")