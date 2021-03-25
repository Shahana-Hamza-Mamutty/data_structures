def my_atoi(str)
    query_string = str
    query_string = query_string.strip
    negative = false

    if query_string[/^-/]
        negative = true
        query_string[0] = ""
    elsif query_string[/^\+/]
        query_string[0] = ""
    end

    query_string = query_string[/^\d+/]

    return 0 if !query_string
    
    query_string = query_string.to_i
    
    if query_string >= 2147483648 && !negative
        return 2147483647
    end
        
    query_string = 2147483648 if query_string > 2147483648
    
    query_string = -(query_string) if negative 
    
    query_string
end

s = "-91283472332"

p my_atoi(s)