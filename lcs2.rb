def subsequence(s1, s2)

        return 0 if s1.empty? || s2.empty?

        num=Array.new(s1.size){Array.new(s2.size)}
        p "==========================================="
        p num
        p s1.scan(/./)
        p s2.scan(/./)
        s1.scan(/./).each_with_index{|letter1,i|
            s2.scan(/./).each_with_index{|letter2,j|

                    if s1[i]==s2[j]
                        if i==0||j==0
                           num[i][j] = 1
                        else
                           num[i][j]  = 1 + num[i - 1][ j - 1]
                        end
                    else
                        if i==0 && j==0
                           num[i][j] = 0
                        elsif i==0 &&  j!=0  #First ith element
                           num[i][j] = [0,  num[i][j - 1]].max
                        elsif j==0 && i!=0  #First jth element
                            num[i][j] = [0, num[i - 1][j]].max
                        elsif i != 0 && j!= 0
                          num[i][j] = [num[i - 1][j], num[i][j - 1]].max
                        end
                    end
                    p num
                    p "====32==========="
            }
        }
        num[s1.length - 1][s2.length - 1]

end

puts subsequence("ABCDEF","FBDAMN")