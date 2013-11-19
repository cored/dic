require 'spec_helper'

describe Dictionary::Manager do
  context 'sequences file' do
    after do
      File.delete(File.join(
        File.expand_path('.'), 'sequences.txt'))
    end

    it 'generates a sequences file base on a dictionary' do
      dictionary_file = []
      Dictionary::Manager.for(dictionary_file).sequences
      expect(
        Dir.glob(
          File.join(
            File.expand_path('.'), 'sequences.txt')
        ).size
      ).to eql 1
    end

    it 'content should be only valid sequences' do
      dictionary_file = IO.readlines('spec/fixtures/dictionary.txt')
      Dictionary::Manager.for(dictionary_file).sequences
      expect(
        IO.readlines('sequences.txt').first
      ).to eql "AAAS\n"
    end
  end

  context 'words file' do
    after do
      File.delete(File.join(
        File.expand_path('.'), 'words.txt'))
    end

    it 'generates a words file base on a dictionary' do
      dictionary_file = []
      Dictionary::Manager.new(dictionary_file).words
      expect(
        Dir.glob(
          File.join(
            File.expand_path('.'), 'words.txt')
        ).size
      ).to eql 1
    end

    it 'content should be only valid words' do
      dictionary_file = IO.readlines('spec/fixtures/dictionary.txt')
      Dictionary::Manager.for(dictionary_file).words
      expect(
        IO.readlines('words.txt').first
      ).to eql "AAAS\n"
    end
  end

end
