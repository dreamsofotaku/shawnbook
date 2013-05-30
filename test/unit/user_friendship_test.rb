require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
	assert_nothing_raised do
	UserFriendship.create user: users(:taylorjones), friend: users(:mikethefrog)
	end
  end

  test "that creating a friendship based on a user id and friend id works" do
  	UserFriendship.create user_id: users(:taylorjones).id, friend_id: users(:mikethefrog).id
  	assert users(:taylorjones).friends.include?(users(:mikethefrog))
  end

end
