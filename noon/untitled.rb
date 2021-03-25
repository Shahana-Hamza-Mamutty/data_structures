#!/bin/ruby

require 'json'
require 'stringio'



#
# Complete the 'getAuthorHistory' function below.
#
# The function is expected to return a STRING_ARRAY.
# The function accepts STRING author as parameter.
#
# Base urls:
#   https://jsonmock.hackerrank.com/api/article_users?username=
#   https://jsonmock.hackerrank.com/api/articles?author=
#
#
require 'net/http'

def getAuthorHistory(author)
    # Write your code here
    # history = []
    
    # aa = Net::HTTP.get('example.com', '/index.html') # => String
    p "-------"
    uri = URI("https://jsonmock.hackerrank.com/api/article_users?username=#{author}")
# params = { :limit => 10, :page => 3 }
# uri.query = URI.encode_www_form(params)

# res = Net::HTTP.get_response(uri)
# puts res.body if res.is_a?(Net::HTTPSuccess)
# res.body
p "[----"


end

# author = "asdsd"

# getAuthorHistory(author)


fptr = File.open(ENV['OUTPUT_PATH'], 'w')