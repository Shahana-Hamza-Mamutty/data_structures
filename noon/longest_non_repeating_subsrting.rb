def length_of_longest_substring(str)

  query_string = str.split('')
  pos_hash = {}
  max_len = 0
  n = 0

  query_string.each_with_index do |val, index|
    if pos_hash[val]
      pos_hash.delete_if{ |k, v| (pos_hash[val] && v <= pos_hash[val])}
      pos_hash[val] = index
      n = pos_hash.length
    else
      pos_hash[val] = index
      n = n + 1
    end
    max_len = n if n > max_len
  end

  max_len

end