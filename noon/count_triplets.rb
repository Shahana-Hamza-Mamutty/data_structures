def count_triplets(arr, ratio)
  count_hash = {}
  arr.each do |val|
    count_hash[val] = count_hash[val] ? count_hash[val]+1 : 1
  end

  total_triplets = 0

  count_hash.each do |key, val|
    prev_val = key/ratio
    next_val = key*ratio

    total_triplets += count_hash[prev_val].to_i * count_hash[key].to_i * count_hash[next_val].to_i
  end

  total_triplets
end


arr = [1, 3, 9, 9, 27, 81]
cr = 3
p count_triplets(arr, cr)