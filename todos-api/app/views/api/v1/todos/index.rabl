collection :@todos
attributes :id, :title

# child user: :created_by do
# 	:id, :name, :email
# end

child(user: :created_by) do
	attributes :id, :name, :email
end

child(items: :items) do
	attributes :id, :name
end

# child(object. => :gift_cards) do
#   extends "spree/api/v2/users/gift_cards/show"
# end
# child(:user) { attributes :full_name }
# node(:read) { |post| post.read_by?(@user) }