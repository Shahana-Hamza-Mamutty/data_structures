def longest_common_prefix(strs)

  return "" if strs.length==0

  common_prefix = strs[0]

  strs.each_with_index do |val, index|
    next if index == 0
    break if common_prefix.length == 0

    while common_prefix.length > 0
      find_match = val[/^#{common_prefix}/]
      if find_match.nil?
        common_prefix.chop!
      else
        common_prefix = find_match
        break
      end
    end
  end


  common_prefix
end

strs = ["flower","flow","flight"]
p longest_common_prefix(strs)