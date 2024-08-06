# Capybara Starter Project

This project provides a starting point for creating acceptance tests for web applications using Capybara and RSpec in a standalone application. It also includes a set of simple tests for logging into BitBucket.org.

## Getting Started

Install the dependencies:

    bundle install

## Running the Specs

You can run the suite with:

    bundle exec rake spec

## Support Files

This starter includes some helper methods that can be included in your tests. These files are located in the `spec/support` directory. Any additional files added to this directory will automatically be included in your tests. However you must manually register the module with RSpec like so:

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

- [Capybara](https://github.com/jnicklas/capybara)
- [Capybara Cheat Sheet](https://learn.thoughtbot.com/test-driven-rails-resources/capybara.pdf)
- [Simple Tricks to Clean Up Your Capybara Tests](http://www.elabs.se/blog/51-simple-tricks-to-clean-up-your-capybara-tests)
