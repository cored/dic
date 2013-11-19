require 'spec_helper'

describe Dictionary::FileHandler do 

  context 'invalid content' do 
    pending 'handle nil content' do 
      expect(
        Dictionary::FileHandler.for(nil)
      ).to raise_error Dictionary::FileHandler::Error
    end
  end

end
