require 'spec_helper'

shared_examples_for 'an invalid cli run' do 
  it 'returns an error' do 
    expect do 
      subject
    end.to raise_error Dictionary::CLI::Error, expected_message
  end
end


describe Dictionary::CLI, '.new' do 
  let(:cli) { Dictionary::CLI.new(arguments) }

  subject { cli } 

  context 'with unknown flag' do 
    let(:arguments) { %w[--invalid] } 

    let(:expected_message) { 'invalid option: --invalid' }

    it_should_behave_like 'an invalid cli run'
  end

  context 'without a filename' do 
    let(:arguments) { %w[--filename] }

    let(:expected_message) { 'missing argument: --filename' }

    it_should_behave_like 'an invalid cli run'
  end

end
