def anagram_pairs_count(str)
  substrs = Hash.new()

  for l in 0..(str.length - 1)
    for h in l..(str.length - 1)
      substr = str[l..h]
      substrs[substr.length] ||= Hash.new(0)
      substrs[substr.length][substr.chars.sort.join] += 1
    end
  end

  p "=-==================="
  p substrs

  total = 0

  substrs.each do |substr_length, anagram_to_count|
    p "==="
    p anagram_to_count
    pairs_count_list = anagram_to_count.values.map do |cnt|
      (cnt * (cnt - 1)) / 2
    end
    p pairs_count_list
    total += pairs_count_list.reduce(&:+)
  end
  total
end

result = anagram_pairs_count("kkkk")
p "-----------"
p result