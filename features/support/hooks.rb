# frozen_string_literal: true

Before('@algorithm') do
  Capybara.current_driver = :null
end

After do |scenario|
  if !scenario.source_tag_names.include?('@algorithm') && scenario.failed?
    # take screenshot
    Dir.mkdir('result_execution') unless Dir.exist?('result_execution')
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    screenshot_full_path = Helpers.take_screenshot(scenario_name.downcase)
    attach(screenshot_full_path, 'image/png')
    report.merge!({ message: scenario.exception.message, backtrace: scenario.exception.backtrace })
  end

  if !scenario.source_tag_names.include?('@algorithm') && page.driver.browser.window_handles.count > 1
    page.driver.browser.close
    last_handle = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(last_handle)
  end

  unless scenario.source_tag_names.include?('@algorithm')
    page.execute_script('window.localStorage.clear()')
    Capybara.reset_sessions!
    Capybara.reset!
  end
end
