require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get leave" do
    get :leave
    assert_response :success
  end

  test "should get changelog" do
    get :changelog
    assert_response :success
  end

end
