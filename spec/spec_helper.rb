require 'capybara/rspec'
require 'dotenv'

# Load env vars from .env file
Dotenv.load

# Configure Selenium WebDriver
require 'selenium/webdriver'

# Configure Standard Chrome
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument '--window-size=1920,1080'
  options.add_argument '--ignore-certificate-errors'
  options.add_preference('plugins.always_open_pdf_externally', true)

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options:,
  )
end

Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

# Require all support files
Dir['./spec/support/*.rb'].sort.each { |file| require file }
