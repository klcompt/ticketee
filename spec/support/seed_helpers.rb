module SeedHelpers
  def create_user!(attributes={})
    user = Factory(:user)
    user.confirm!
    user
  end
end

RSpec.configure do |config|
  config.include SeedHelpers
end
