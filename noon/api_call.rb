require 'net/http'

def make_api_call(page=1, per_page=5)
  # p "-------"
  # params = { page: page, per_page: per_page }
  # uri = URI('https://sandbox.danube.sa/en/api/orders/mine')
  # uri.query = URI.encode_www_form(params)

  # req = Net::HTTP::Get.new(uri)
  # req['X-Spree-Token'] = "d4b71b5fb3b752c528911deb3117b83b24d7fc27f2205d3e"

  # p "===sfsdf"
  # res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  #   http.request(req)
  # }

  # p "=================="
  # p res






  # request = Net::HTTP::Get.new(uri.request_uri)
  # request.add_field("email", email)
  # request.add_field("token", token)
  # response = http.request(request)
  # render json: response.body


uri = URI("https://sandbox.danube.sa/en/api/orders/mine?page=1&per_page=5")
req = Net::HTTP::Get.new(uri)
req['X-Spree-Token'] = "d4b71b5fb3b752c528911deb3117b83b24d7fc27f2205d3e"

p "----"
p uri.hostname
p uri.port
res = Net::HTTP.start(uri.hostname, uri.port) {|http|
  http.request(req)
}

p "--------------------"
p res
puts res.body
end

def get_orders
end

make_api_call