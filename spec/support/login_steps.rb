require 'capybara/dsl'

module LoginSteps
  extend RSpec::Matchers::DSL

  def sign_in_path
    'https://bitbucket.org/account/signin/'
  end

  def login_form
    find('#aid-login-form')
  end

  def good_user
    create_user ENV['USER_NAME'], ENV['PASSWORD']
  end

  def bad_user
    create_user 'unknown', 'unknown'
  end

  def create_user(username, password)
    OpenStruct.new username: username, password: password
  end

  def log_in_with(user)
    ensure_on sign_in_path

    within login_form do
      fill_in 'Email', with: user.username
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include LoginSteps, :type => :feature
end
