# def common_child(str1, str2)
#   count_hash_1 = calculate_count(str1)
#   count_hash_2 = calculate_count(str2)

#   len = 0

#   count_hash_1.each do |key, val|
#     p "====="
#     p key
#     p val
#     p count_hash_2[key]
#     len += (count_hash_2[key] & val).length
#   end

#   len
# end

# def calculate_count(str)
#   str_arr = str.split('')
#   count_of_letters_hash = {}
#   letter_to_count_hash = {}

#   str_arr.each do |letter|
#     if letter_to_count_hash[letter]
#       existing_count = letter_to_count_hash[letter]
#       # if count_of_letters_hash[existing_count]-1 == 0
#       #   count_of_letters_hash.delete(existing_count)
#       # else
#         count_of_letters_hash[existing_count] = count_of_letters_hash[existing_count]-1
#       # end

#       count = letter_to_count_hash[letter] ? letter_to_count_hash[letter]+1 : 1
#       letter_to_count_hash[letter] = count
#       count_of_letters_hash[count] = count_of_letters_hash[count] ? count_of_letters_hash[count]+1 : 1
#     else
#       letter_to_count_hash[letter] = 1
#       count_of_letters_hash[1] = count_of_letters_hash[1] ? count_of_letters_hash[1]+1 : 1
#     end

#   end

#   count_of_letters_hash
# end



# Complete the commonChild function below.
def commonChild(s1, s2)
    a = s1.split('')
    b = s2.split('')
    num = Array.new(a.size){Array.new(b.size, 0)}
    a.each_with_index do |val_1, i|
        b.each_with_index do |val_2, j|
            if i == 0 || j == 0
                if a[i] == b[j]
                    num[i][j] = 1
                else
                    num[i][j] = num[i][j-1] unless num[i][j-1].nil?
                end 
            elsif a[i] == b[j]
                num[i][j] = num[i-1][j-1] + 1
            elsif a[i] != b[j]
                num[i][j] = [num[i][j-1], num[i-1][j]].max
            end    
        end
    end
    num.last.last

end



p commonChild("OUDFRMYMAW", "AWHYFCCMQX")