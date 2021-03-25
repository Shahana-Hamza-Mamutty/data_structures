def valid_string(str)
  str_arr = str.split('')
  count_of_letters_hash = {}
  letter_to_count_hash = {}

  str_arr.each do |letter|
    if letter_to_count_hash[letter]
      existing_count = letter_to_count_hash[letter]
      if count_of_letters_hash[existing_count]-1 == 0
        count_of_letters_hash.delete(existing_count)
      else
        count_of_letters_hash[existing_count] = count_of_letters_hash[existing_count]-1
      end

      count = letter_to_count_hash[letter] ? letter_to_count_hash[letter]+1 : 1
      letter_to_count_hash[letter] = count
      count_of_letters_hash[count] = count_of_letters_hash[count] ? count_of_letters_hash[count]+1 : 1
    else
      letter_to_count_hash[letter] = 1
      count_of_letters_hash[1] = count_of_letters_hash[1] ? count_of_letters_hash[1]+1 : 1
    end

  end

  if count_of_letters_hash.length > 2
    return 'NO'
  elsif count_of_letters_hash.length == 2
    keys = count_of_letters_hash.keys
    max_key = keys.max
    min_key = keys.min
    if min_key == 1 and count_of_letters_hash[min_key] == 1
      return "YES"
    end

    if max_key - min_key > 1
      return "NO"
    end

    if count_of_letters_hash[max_key] == 1
      return "YES"
    else
      return "NO"
    end
  else
   return "YES"
  end

end

str = "ibfdgaeadiaefgbhbdghhhbgdfgeiccbiehhfcggchgghadhdhagfbahhddgghbdehidbibaeaagaeeigffcebfbaieggabcfbiiedcabfihchdfabifahcbhagccbdfifhghcadfiadeeaheeddddiecaicbgigccageicehfdhdgafaddhffadigfhhcaedcedecafeacbdacgfgfeeibgaiffdehigebhhehiaahfidibccdcdagifgaihacihadecgifihbebffebdfbchbgigeccahgihbcbcaggebaaafgfedbfgagfediddghdgbgehhhifhgcedechahidcbchebheihaadbbbiaiccededchdagfhccfdefigfibifabeiaccghcegfbcghaefifbachebaacbhbfgfddeceababbacgffbagidebeadfihaefefegbghgddbbgddeehgfbhafbccidebgehifafgbghafacgfdccgifdcbbbidfifhdaibgigebigaedeaaiadegfefbhacgddhchgcbgcaeaieiegiffchbgbebgbehbbfcebciiagacaiechdigbgbghefcahgbhfibhedaeeiffebdiabcifgccdefabccdghehfibfiifdaicfedagahhdcbhbicdgibgcedieihcichadgchgbdcdagaihebbabhibcihicadgadfcihdheefbhffiageddhgahaidfdhhdbgciiaciegchiiebfbcbhaeagccfhbfhaddagnfieihghfbaggiffbbfbecgaiiidccdceadbbdfgigibgcgchafccdchgifdeieicbaididhfcfdedbhaadedfageigfdehgcdaecaebebebfcieaecfagfdieaefdiedbcadchabhebgehiidfcgahcdhcdhgchhiiheffiifeegcfdgbdeffhgeghdfhbfbifgidcafbfcd"
p valid_string(str)