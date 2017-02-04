require 'spec_helper'

describe Sequence do
  let(:sequence) { Sequence.new 1, 'GATC' }

  it 'can be created' do
    expect(sequence).to_not be_nil
  end

  it '#id' do
    expect(sequence.id).to_not be_nil
  end

  it '#body' do
    expect(sequence.body).to_not be_nil
  end

  it '#as_fasta' do
    expect(sequence.as_fasta).to match /^>/
  end

  it '#to_h' do
    expect(sequence.to_h).to be_a(Hash)
  end
end
