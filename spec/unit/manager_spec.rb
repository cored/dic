require 'spec_helper'

describe Dictionary::Manager do 
  context 'invalid returns' do 
    pending 'returns an exception with nil' do 
      Dictionary::FileHandler.should_receive(:create_words_file).and_return(nil)
      expect(
        Dictionary::Manager.new([]).words
      ).to raise_error
    end
  end
end
