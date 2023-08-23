# frozen_string_literal: true

module Objects
  module Web
    # This class contains the home page objects of the web page.
    class HomePage < SitePrism::Page
      set_url ENV['URL_WORDCOUNTER']

      element :lbl_character_count, '#character_count'
      element :lbl_repeat_time_first, :xpath, '//*[@id="kwd-accordion-data"]/a[1]/span[1]'
      element :lbl_repeat_time_second, :xpath, '//*[@id="kwd-accordion-data"]/a[2]/span[1]'
      element :lbl_repeat_time_third, :xpath, '//*[@id="kwd-accordion-data"]/a[3]/span[1]'
      element :lbl_top_counter, '#top_counter'
      element :lbl_word_count, '#word_count'
      element :lbl_word_first, :xpath, '//*[@id="kwd-accordion-data"]/a[1]/span[2]'
      element :lbl_word_second, :xpath, '//*[@id="kwd-accordion-data"]/a[2]/span[2]'
      element :lbl_word_third, :xpath, '//*[@id="kwd-accordion-data"]/a[3]/span[2]'
      element :txt_word_input, '#box'
    end
  end
end
