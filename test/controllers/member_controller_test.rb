class MembersControllerTest < ActionController::TestCase
  include Warden::Test::Helpers
  
  def setup
    @member = members( :mike )
    sign_in(@member)
  end
end
