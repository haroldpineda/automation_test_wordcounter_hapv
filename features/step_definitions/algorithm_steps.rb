# frozen_string_literal: true

Given('A text file is loaded and its content is extracted') do
  @task = Task::Back::ProcessFile.new
  @text_extract = @task.load_file
end

Then('The text is processed and the number of characters, words and the density of use are identified') do
  @task.process_text(@text_extract)
end
