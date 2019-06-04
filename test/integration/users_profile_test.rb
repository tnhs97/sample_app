require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users :michael
  end

  test "profile display" do
    log_in_as @user
    get user_path(@user)
    assert_template "users/show"
    assert_select "h1", text: @user.name
    assert_select "title", full_title(@user.name)
    assert_select "h1>img.gravatar"
    assert_match @user.microposts.size.to_s, response.body
    assert_select "div.pagination", count: 1
    @user.microposts.paginate(page: 1,
      per_page: Settings.index_per_page). each do |micropost|
      assert_match micropost.content, response.body
    end
    assert_match @user.following.size.to_s, response.body
    assert_match @user.followers.size.to_s, response.body
  end
end
