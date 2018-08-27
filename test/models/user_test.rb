require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
   @user = User.new(name: "James", email: "example@user.com", password: "examplepassword")
 end

 test "should be valid" do
   assert @user.valid?
 end

 test "associated entries should be destroyed" do
    @user.save
    @user.entries.create!(content: "Lorem ipsum")
    assert_difference 'Entry.count', -1 do
      @user.destroy
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
