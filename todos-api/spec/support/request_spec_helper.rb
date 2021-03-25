# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
  	ActiveSupport::JSON.decode(response.body)
  end
end