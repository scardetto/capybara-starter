require 'capybara/rspec'
require 'dotenv'

# Load env vars from .env file
Dotenv.load

# Configure Selenium WebDriver
require 'selenium/webdriver'
driver = :selenium
browser = :chrome
options = {}

Capybara.register_driver driver do |app|
  driver_options = {browser: browser}.merge(options)
  Capybara::Selenium::Driver.new(app, driver_options)
end

# Configure Chrome Browser
driver = :chrome
browser = :chrome
options = {}

Capybara.register_driver driver do |app|
  driver_options = {browser: browser}.merge(options)
  Capybara::Selenium::Driver.new(app, driver_options)
end

# Configure Headless Chrome
driver = :headless_chrome
browser = :chrome
driver_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  chromeOptions: {
    args: %w(headless disable-gpu no-sandbox)
  }
)

Capybara.register_driver driver do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: browser,
    desired_capabilities: driver_capabilities)
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_driver = :headless_chrome

# Require all support files
Dir["./spec/support/*.rb"].each {|file| require file }
