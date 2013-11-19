require 'optparse'

module Dictionary
  class CLI
    Error = Class.new(RuntimeError)

    class << self 
      alias :run :new
    end

    def initialize(arguments = [])
      @filename = ""
      @arguments = arguments
      run_dic(parse_arguments)
    end

    private 

    def parse_arguments
      opts = OptionParser.new do |builder|
        builder.banner = 'usage: dic dictionary.txt' 

        builder.on '-f', '--filename DICTIONARY_FILENAME', 'Dictionary filename to use' do |filename|
          @filename << filename
        end
      end

      patterns = build_options(opts)
      self
    end

    def build_options(opts)
      begin 
        opts.parse!(@arguments)
      rescue OptionParser::ParseError => error
        raise Error, error.message, error.backtrace
      end 
    end

    def run_dic
      dic_manager = Dictionary::Manager.for(load_filename)
      dic_manager.sequences
      dic_manager.words
      self
    end

    def load_filename
      IO.readlines(@filename)
    end

  end
end
