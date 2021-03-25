# def find_index_of_invalid_string(str)
#   valid_words = ["programmer", "grammproer", "prozmerqgram"]
#   index_to_length = {}

#   start_indexes = []
#   end_indexes = []

#   valid_words.each do |val|
#     next if !str.index(val)

#     index_to_length[str.index(val)] = val.length
#   end

#   start_index_first_str = index_to_length.keys.min
#   start_index_second_str = index_to_length.keys.max


#   start_index_end = start_index_first_str + index_to_length[start_index_first_str]

#   invalid_str_length = start_index_second_str - start_index_end


#   invalid_str_length
# end

# str = "progxrammerrxproxgrammer"


# p find_index_of_invalid_string(str)




def countTeams(skills, minPlayers, minLevel, maxLevel)
    # Write your code here
    
    valid_scores = skills.select{|score| score >= minLevel && score <= maxLevel}

    count = 0
    pp = 0


    (minPlayers..valid_scores.length).each do |min_player|
      count += valid_scores.permutation(min_player).to_a.map(&:sort).uniq.count
      pp += valid_scores.combination(min_player).to_a.map(&:sort).uniq.count
    end
    p "===="
    p count
    p pp

  count
end

skills = [4, 8, 5, 6]
minPlayers = 1
minLevel = 5
maxLevel = 7

countTeams(skills, minPlayers, minLevel, maxLevel)