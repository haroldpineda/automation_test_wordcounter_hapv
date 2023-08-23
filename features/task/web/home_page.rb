# frozen_string_literal: true

module Task
  module Web
    # This class contains the actions and data to interact with the objects of the web page.
    class Home
      def initialize
        @home = Objects::Web::HomePage.new
        @home.load
      end

      def input_words(type)
        case type
        when 'random_number'
          @random_number_words = Faker::Number.between(from: 1, to: 500)
          text = Faker::Lorem.words(number: @random_number_words).join(' ')
        when '2000'
          text = Faker::Lorem.words(number: 2000).join(' ')
        end
        @home.txt_word_input.set text
        sleep 0.5
      end

      def value_label_count_words
        @home.lbl_word_count.text.to_i
      end

      def random_number_used
        @random_number_words
      end

      def character_value_textbox
        @home.txt_word_input.value.length
      end

      def value_label_count_characteres
        @home.lbl_character_count.text.gsub(/[,.]/, '').to_i
      end

      def words_frecuency
        text = @home.txt_word_input.value
        word_frequency = Hash.new(0)
        text.downcase.scan(/\w+/) { |word| word_frequency[word] += 1 }
        @top_words = word_frequency.max_by(3) { |_, frequency| frequency }
      end

      def most_common_word
        @top_words[0][0]
      end

      def second_common_word
        @top_words[1][0]
      end

      def third_common_word
        @top_words[2][0]
      end

      def repeated_times_first_word
        @top_words[0][1]
      end

      def repeated_times_second_word
        @top_words[1][1]
      end

      def repeated_times_third_word
        @top_words[2][1]
      end

      def label_keyword_densit_first
        @home.lbl_word_first.text
      end

      def label_keyword_densit_second
        @home.lbl_word_second.text
      end

      def label_keyword_densit_third
        @home.lbl_word_third.text
      end

      def label_repeated_times_first_word
        @home.lbl_repeat_time_first.text.gsub(/\s?\(.*\)/, '').to_i
      end

      def label_repeated_times_second_word
        @home.lbl_repeat_time_second.text.gsub(/\s?\(.*\)/, '').to_i
      end

      def label_repeated_times_third_word
        @home.lbl_repeat_time_third.text.gsub(/\s?\(.*\)/, '').to_i
      end
    end
  end
end
