# frozen_string_literal: true

module Task
  module Back
    # This class contains the actions to process a text file.
    class ProcessFile
      def load_file
        File.read("#{Dir.pwd}/features/files/text_to_scan.txt")
      end

      def process_text(text_extract)
        words = text_extract.split
        word_count = words.size
        character_count = text_extract.length
        puts "Number of words: #{word_count}\nNumber of characters: #{character_count}"
        word_frequency = Hash.new(0)
        words.each { |word| word_frequency[word] += 1 }
        sorted_word_frequency = word_frequency.sort_by { |_, frequency| -frequency }
        sorted_word_frequency.each do |word, frequency|
          puts "#{word}: #{frequency}"
        end
      end
    end
  end
end
