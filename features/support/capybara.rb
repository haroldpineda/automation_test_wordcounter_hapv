# frozen_string_literal: true

def setup_for_firefox
  Capybara.register_driver :firefox_custom do |app|
    options = Selenium::WebDriver::Firefox::Profile.new
    Capybara::Selenium::Driver.new(app, options: options, marionette: true)
  end
  Capybara.run_server = false
  Capybara.default_driver = :selenium
end

def config_client
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 120
  client.open_timeout = 120
  client
end

def setup_for_chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--start-maximized')
    Capybara::Selenium::Driver.new(app, options: options, browser: :chrome)
  end
  Capybara.default_driver = :chrome
  Capybara.default_max_wait_time = 10
  Capybara.javascript_driver = :webkit
end

def setup_browser(browser)
  case browser.to_sym
  when :firefox then setup_for_firefox
  else setup_for_chrome
  end
end
setup_browser(ENV.fetch('BROWSER', :chrome))
