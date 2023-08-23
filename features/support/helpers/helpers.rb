# frozen_string_literal: true

# Screenshots
class Helpers
  class << self
    def take_screenshot(file_name)
      current_date = Time.now.strftime('%Y_%m_%d').to_s
      timer_path = Time.now.strftime('%H_%M_%S').to_s
      folder_path = "result_execution/screenshots/test_failed/run_#{current_date}"
      screenshot_full_path = "#{folder_path}/#{file_name}_#{timer_path}.png".delete('#,')
      Capybara.page.save_screenshot(screenshot_full_path)
      screenshot_full_path
    end
  end
end
