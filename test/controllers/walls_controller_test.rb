require 'test_helper'

class WallsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get post" do
    get :post
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

end
