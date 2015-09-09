require 'capybara/dsl'

module LoginSteps
  extend RSpec::Matchers::DSL

  def sign_in_path
    'https://bitbucket.org/account/signin/'
  end

  def login_form
    find('#log-in-container')
  end

  def good_user
    OpenStruct.new username: ENV['USER_NAME'], password: ENV['PASSWORD']
  end

  def bad_user
    OpenStruct.new username: 'unknown', password: 'unknown'
  end

  def log_in_with(user)
    ensure_on sign_in_path

    within login_form do
      fill_in 'Username or email', with: user.username
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'
  end

  matcher :have_error do |text|
    match { |node| node.has_selector?("div.error", :text => text) }
    match_when_negated { |node| node.has_no_selector?("div.error", :text => text) }
  end
end

RSpec.configure do |config|
  config.include LoginSteps, :type => :feature
end
