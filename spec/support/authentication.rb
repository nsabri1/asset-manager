module AuthenticationControllerHelpers
  def login_as(user)
    request.env['warden'] = double(
      authenticate: true,
      authenticate!: true,
      authenticated?: true,
      user: user
    )
  end

  def not_logged_in
    request.env['warden'] = double(
      authenticate: true,
      authenticate!: true,
      authenticated?: false,
      user: nil
    )
  end

  def stub_user
    FactoryBot.create(:user)
  end

  def login_as_stub_user
    login_as stub_user
  end
end
RSpec.configuration.include AuthenticationControllerHelpers, type: :controller

module AuthenticationFeatureHelpers
  def login_as(user)
    GDS::SSO.test_user = user
  end

  def not_logged_in
    GDS::SSO.test_user = nil
  end

  def stub_user
    FactoryBot.create(:user)
  end

  def login_as_stub_user
    login_as stub_user
  end
end
RSpec.configuration.include AuthenticationFeatureHelpers, type: :request
