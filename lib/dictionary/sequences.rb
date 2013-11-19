module Dictionary
  class Sequences
    def initialize(words)
      @words = Words.new words
      @values = @words.map { |word| Sequence.new word }
    end

    def to_hash
      @values.each_with_object({}) do |sequence, hash|
        hash.merge! sequence.to_hash
      end
    end

    class Sequence
      def initialize(word)
        @word = word
        freeze
      end

      def values
        (0..@word.size - 4)
        .map { |idx| @word.slice(idx, 4) }
        .reject { |word| word =~ /\d/ }
      end

      def to_hash
        values.each_with_object({}) do |seq, hash|
          hash[seq] = @word
        end
      end
    end
  end

  class Words
    include Enumerable

    def initialize(words)
      @words = words
    end

    def each
      return to_enum unless block_given?
      @words.each { |word| yield word }
    end
  end
end
