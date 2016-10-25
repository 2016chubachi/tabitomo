require 'test_helper'

class SearchGuidesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
