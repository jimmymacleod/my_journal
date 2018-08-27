require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
   @user = users(:michael)
   @entry = @user.entries.build(content: "Lorem ipsum")
 end

 test "should be valid" do
   assert @entry.valid?
 end

 test "user id should be present" do
   @entry.user_id = nil
   assert_not @entry.valid?
 end

 test "content should be present" do
   @entry.content = "   "
   assert_not @entry.valid?
 end

 test "content should be at most 1000 characters" do
    @entry.content = "a" * 1001
    assert_not @entry.valid?
 end

 test "order should be most recent first" do
  assert_equal entries(:most_recent), Entry.first
 end

end
