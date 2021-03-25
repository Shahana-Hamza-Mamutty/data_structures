def freq_query(queries)
	object_freq_hash = {}
  freq_object_hash = {}
  res = []
  queries.each do |query|
    action = query[0]
    object = query[1]

    case action
    when 1
      object_freq_hash[object] = object_freq_hash[object] ? (object_freq_hash[object]+1) : 1
      count = object_freq_hash[object]
      if count-1 > 0
        freq_object_hash[count-1] = freq_object_hash[count-1] - [object]
      end
      freq_object_hash[count] = freq_object_hash[count] ? (freq_object_hash[count] + [object]) : [object]
    when 2
      if object_freq_hash[object]
        object_freq_hash[object] = [(object_freq_hash[object]-1), 0].max 
        count = object_freq_hash[object]
        freq_object_hash[count+1] = freq_object_hash[count+1] - [object]
        freq_object_hash[count] = freq_object_hash[count] ? (freq_object_hash[count] + [object]) : [object]
      end
    when 3
      if freq_object_hash[object] && !freq_object_hash[object][0].nil?
        res << 1
      else
        res << 0
      end
    end
  end
  res
end

q = [
  [1, 3],
  [2, 3],
  [3, 2],
  [1, 4],
  [1, 5],
  [1, 5],
  [1, 4],
  [3, 2],
  [2, 4],
  [3, 2]
]

# queries = []

# q.each do |i|
#   queries[i] = gets.rstrip.split.map(&:to_i)
# end

puts freq_query(q)