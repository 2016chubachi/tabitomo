require 'test_helper'

class GuideDetailControllerTest < ActionController::TestCase
  include Warden::Test::Helpers
  
  def setup
    Warden.test_mode!
    @member = members( :mike )
    login_as(@member, :scope => :member)
  end
    
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

end
