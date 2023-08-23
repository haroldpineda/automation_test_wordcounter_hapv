# frozen_string_literal: true

After do |scenario|
  if scenario.failed?
    # take screenshot
    Dir.mkdir('result_execution') unless Dir.exist?('result_execution')
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    screenshot_full_path = Helpers.take_screenshot(scenario_name.downcase)
    attach(screenshot_full_path, 'image/jpg')
    report.merge!({ message: scenario.exception.message, backtrace: scenario.exception.backtrace })
  end

  if page.driver.browser.window_handles.count > 1
    page.driver.browser.close
    last_handle = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(last_handle)
  end

  page.execute_script('window.localStorage.clear()')
  Capybara.reset_sessions!
  Capybara.reset!
end
