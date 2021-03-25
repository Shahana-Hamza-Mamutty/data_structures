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


def make_api_call(url, params)
	uri = URI(url)
	uri.query = URI.encode_www_form(params)

	res = Net::HTTP.get_response(uri)
	JSON.parse(res.body)
end

def fetch_details_by_username(author, page=1)
	url = "https://jsonmock.hackerrank.com/api/article_users" #U RI("https://jsonmock.hackerrank.com/api/article_users?username=#{author}")
    params = { username:  author, page: page}
    response = make_api_call(url, params)
    response
end

def fetch_author_details(author, page=1)
	url = "https://jsonmock.hackerrank.com/api/articles"
	params = { author:  author, page: page}
	response = make_api_call(url, params)
	response
end

def getAuthorHistory(author)
    # Write your code here
    history = []
    about = []
    authors = []

    # url = "https://jsonmock.hackerrank.com/api/article_users" #U RI("https://jsonmock.hackerrank.com/api/article_users?username=#{author}")
    # params = { author:  author}
    # response = make_api_call(url, params)


    initial_data = fetch_details_by_username(author)


    p "=================="
    p initial_data

    page = 1
    total_pages = initial_data["total_pages"]

    data = initial_data["data"]

    about += data.map{|d| d["about"]}
    authors += data.map{|d| d["username"]}

    while page < total_pages
    	page += 1
    	response = fetch_details_by_username(author, page)
    	data = response["data"]
	    about += data.map{|d| d["about"]}
	    authors += data.map{|d| d["username"]}
    end


	authors.each do |author_name|
		url = "https://jsonmock.hackerrank.com/api/articles"
		# params = { author:  author_name}
		initial_author_data = fetch_author_details(author_name)
		history += initial_author_data["data"].map{|d| d["title"] ? d["title"] : d["story_title"]}
		page = 1
   		total_pages = initial_author_data["total_pages"]

   		while page < total_pages
	    	page += 1
	    	response = fetch_author_details(author_name, page)
	    	history += response["data"].map{|d| d["title"] ? d["title"] : d["story_title"]}
	    end
	end    

	history.compact

end

author = "epaga"

getAuthorHistory(author)


# fptr = File.open(ENV['OUTPUT_PATH'], 'w')