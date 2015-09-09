require 'capybara/rspec'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'dotenv'

# Load env vars from .env file
Dotenv.load

# Register Chrome driver
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Use PhantomJS by default
driver = :poltergeist

# Determine the driver based on ENV var
case (ENV['DRIVER'] && ENV['DRIVER'].upcase)
when 'FIREFOX', 'FF'
  driver = :selenium
when 'CHROME'
  driver = :selenium_chrome
end
Capybara.default_driver = driver

# Check for brew cask Firefox
if (/darwin/ =~ RUBY_PLATFORM) != nil # Mac OSX
  brew_cask_path = "#{ENV['HOME']}/Applications/Firefox.app"
  if File.symlink? brew_cask_path
    Selenium::WebDriver::Firefox::Binary.path = "#{File.readlink(brew_cask_path)}/Contents/MacOS/firefox-bin"
  end
end

# Require all support files
Dir["./spec/support/*.rb"].each {|file| require file }
