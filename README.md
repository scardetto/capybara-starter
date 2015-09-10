# Capybara Starter Project
This project provides a starting point for creating acceptance tests for web applications using Capybara and RSpec in a standalone application. It also includes a set of simple tests for logging into BitBucket.org.

## Prerequisites
To run the acceptance suite you must have the following installed:

* Ruby 2.1 or higher
* One of the following WebDrivers:
  * [PhantomJS](http://phantomjs.org/)
  * [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  * [Chrome WebDriver](https://sites.google.com/a/chromium.org/chromedriver/)

## Getting Started
Install the dependencies:

    bundle install

### Configuration
This project uses environment variables as the configuration source. The following environment variables are required to run the example test suite.

* `DRIVER` - The web driver to use to run the tests. Valid values are:
  * `CHROME` - Uses the Chrome WebDriver
  * `FF`, `FIREFOX` - Uses the Firefox WebDriver
  * `PHANTOMJS` - Uses the Poltergeist WebDriver for PhantomJS
* `USER_NAME` - Your BitBucket user name.
* `PASSWORD` - Your BitBucket password.

It's recommended that you specify your environment variables in a configuration file. To do this:

* Create a `.env` file in the root of your project.
* Add your settings to that file as like so:

        DRIVER=CHROME
        USER_NAME=<<Your BitBucket Username>>
        PASSWORD=<<Your BitBucket Password>>

Now you can run the suite with:

    bundle exec rake spec

## Test Suites
This project contains two simple test cases.

1. Logging into BitBucket using valid credentials.
2. Logging into BitBucket using invalid credentials.

The test cases are implemented in two ways.

* In `spec/bitbucket_spec.rb`, a simple declarative style is used.
* In `spec/bitbucket_clean_spec.rb`, the same tests are implemented but with a
  cleaner, more expressive syntax that avoids duplication.

## Support Files
This starter includes some helper methods that can be included in your tests. These files are located in the `spec/support` directory.  Any additional files added to this directory will automatically be included in your tests. However you must manually register the module with RSpec like so:

```ruby
module MySteps
  def my_method
    # Your code goes here
  end
end

RSpec.configure do |config|
  config.include MySteps, :type => :feature
end
```

## Additional Resources
* [Capybara](https://github.com/jnicklas/capybara)
* [Capybara Cheat Sheet](https://learn.thoughtbot.com/test-driven-rails-resources/capybara.pdf)
* [Simple Tricks to Clean Up Your Capybara Tests](http://www.elabs.se/blog/51-simple-tricks-to-clean-up-your-capybara-tests)
