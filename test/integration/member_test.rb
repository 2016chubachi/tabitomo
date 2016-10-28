class MemberTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @member = members( :mike )
    login_as(member, :scope => :member)
  end
end
