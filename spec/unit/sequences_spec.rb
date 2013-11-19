require 'spec_helper'

describe Dictionary::Sequences do 

  it 'returns an empty sequence for an empty list of words' do
    expect(Dictionary::Sequences.new(
      []
    ).to_hash).to eql({})
  end

  it 'returns a sequence of only of four letters' do
    expect(Dictionary::Sequences.new(
      %w[aa dead pace xtreme]
    ).to_hash).to eql({
                       "dead"=>"dead",
                       "pace"=>"pace",
                       "xtre"=>"xtreme",
                       "trem"=>"xtreme",
                       "reme"=>"xtreme"})
  end

  it 'returns a unique sequence' do
    expect(Dictionary::Sequences.new(
      %w[dead deadspace]
    ).to_hash).to eql(
      {"dead"=>"deadspace",
       "eads"=>"deadspace",
       "adsp"=>"deadspace",
       "dspa"=>"deadspace",
       "spac"=>"deadspace",
       "pace"=>"deadspace"})
  end

  it 'returns an alpha characters only' do
    expect(Dictionary::Sequences.new(
      %w[1111 dead deadspace]
    ).to_hash).to eql(
      {"dead"=>"deadspace",
       "eads"=>"deadspace",
       "adsp"=>"deadspace",
       "dspa"=>"deadspace",
       "spac"=>"deadspace",
       "pace"=>"deadspace"})
  end
end
