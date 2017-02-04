require 'spec_helper'

describe MultipleSequenceAlignment do

  let(:sequences) {
    [
      Sequence.new(1, 'CCCCTTTTGGGGAAAA'),
      Sequence.new(2, 'CCCCTTTGGGGAAAA')
    ]
  }

  let(:msa) { MultipleSequenceAlignment.new(sequences) }

  it 'can be created' do
    expect(msa).to_not be_nil
  end

  it '#sequences' do
    expect(msa.sequences).to be_a(Array)
  end

  it '#results' do
    expect(msa.results.size).to eq(msa.sequences.size)
  end

  it '#log is populated after running' do
    expect(msa.log).to be_nil
    msa.results
    expect(msa.log).to_not be_empty
  end
end
