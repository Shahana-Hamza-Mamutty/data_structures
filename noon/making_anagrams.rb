def making_anagram(str1, str2)
  str1_hash = {}
  str2_hash = {}
  str1_arr = str1.split('')
  str2_arr = str2.split('')

  str1_arr.each { |val| str1_hash[val] = str1_hash[val] ? str1_hash[val]+1 : 1 }
  str2_arr.each { |val| str2_hash[val] = str2_hash[val] ? str2_hash[val]+1 : 1 }

  deletions = 0

  str1_hash.each do |key, val|
    str1_val_count = str1_hash[key]
    str2_val_count = str2_hash[key]

    if !str2_val_count 
      deletions += str1_val_count if str1_val_count
    else
      deletions += (str1_val_count - str2_val_count).abs
      str2_hash.delete(key)
    end
  end

  deletions += (str2_hash.values.sum)

  deletions
end

p making_anagram('fcrxzwscanmligyxyvym', 'jxwtrhvujlmrpdoqbisbwhmgpmeoke')