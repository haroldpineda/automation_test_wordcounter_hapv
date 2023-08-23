# frozen_string_literal: true

Given('A text file is loaded and its content is extracted') do
  @task = Task::Back::ProcessFile.new
  @text_extract = @task.load_file
end

Then('The text is processed and the number of characters, words and the density of use are identified') do
  @task.process_text(@text_extract)
end

And('The computational complexity of the algorithm used is shown') do
  puts 'The complexity of this solution is simple because
        as a function of time it depends on the number of
        words and characters of the file to load, since
        the more text the file contains, the longer it
        will take to load, text division, count
        calculate the frequency like this such as memory
        usage to perform operations.'
end
