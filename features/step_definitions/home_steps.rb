# frozen_string_literal: true

Given('User enters the wordcounter.net page') do
  @home = Task::Web::Home.new
  expect(Capybara.page.text).to include '0 words 0 characters'
end

When('User enters a {string} words') do |type|
  @home.input_words(type)
end

Then('User validates the number of words in the counter') do
  expect(@home.value_label_count_words).to eql @home.random_number_used
end

Then('User validates the number of characters in the counter') do
  expect(@home.character_value_textbox).to eql @home.value_label_count_characteres
end

Then('User displays the 3 most repeated words in the text') do
  @home.words_frecuency
  expect(@home.most_common_word).to eq(@home.label_keyword_densit_first)
  expect(@home.second_common_word).to eq(@home.label_keyword_densit_second)
  expect(@home.third_common_word).to eq(@home.label_keyword_densit_third)
end

Then('User displays the number of times that the 3 words were repeated in the text') do
  @home.words_frecuency
  expect(@home.repeated_times_first_word).to eq(@home.label_repeated_times_first_word)
  expect(@home.repeated_times_second_word).to eq(@home.label_repeated_times_second_word)
  expect(@home.repeated_times_third_word).to eq(@home.label_repeated_times_third_word)
end
