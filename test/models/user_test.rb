require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @grant = Grant.find_or_create_by(group_name: "test", sys_admin: true, sys_read: true, sys_download: true, sys_upload: true)
    @user = User.new(username: "User1", email: "name@ucas.ac.cn", grant_id: @grant.id, password: "12345");
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.username = "a"*51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*255+"@ucas.ac.cn"
    assert_not @user.valid?
  end

  test "email validation should reject invalid address" do
    invalid= %w[user@123,com user_at.qq.com user+qq+com user+qq.com]
    invalid.each do |single|
      @user.email = single
      assert_not @user.valid?, "#{invalid.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate = @user.dup
    duplicate.email = @user.email.upcase
    @user.save
    assert_not duplicate.valid?
  end

end
