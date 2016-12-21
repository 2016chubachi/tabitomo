class MemberIntegrationTest < ActionDispatch::IntegrationTest
  # include Warden::Test::Helpers
  include Devise::Test::IntegrationHelpers

  def setup
    Warden.test_mode!
    @member = members( :mike )
    login_as(member, :scope => :member)
  end
end
