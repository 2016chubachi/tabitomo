class MembersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @member = members( :mike )
    sign_in(@member)
  end
end
