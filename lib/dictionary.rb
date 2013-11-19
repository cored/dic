require_relative 'dictionary/cli'
require_relative 'dictionary/sequences'

module Dictionary
  class Manager
    class << self
      alias :for :new
    end

    def initialize(dictionary)
      @file_handler = FileHandler.for(dictionary)
    end

    def sequences
      @file_handler.create_sequences_file
      self
    end

    def words
      @file_handler.create_words_file
      self
    end
  end

  class FileHandler
    SEQUENCES_FILENAME = 'sequences.txt'
    WORDS_FILENAME = 'words.txt'

    class << self
      alias :for :new
    end

    def initialize(content)
      @content = content.map { |word| word.chop }
    end

    def create_sequences_file
      create_file SEQUENCES_FILENAME do |file, sequence, word|
        file.write "#{sequence}\n"
      end
      self
    end

    def create_words_file
      create_file WORDS_FILENAME do |file, sequence, word|
        file.write "#{word}\n"
      end
      self
    end

    private

    def create_file(filename, &block)
      File.open(filename, 'w') do |file|
        Dictionary::Sequences.new(@content).to_hash.each_pair do |sequence, word|
          yield file, sequence, word
        end
      end
    end
  end
end
