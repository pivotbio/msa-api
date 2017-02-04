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

  [Clustalw, Muscle].each do |alignment_tool|
    let(:aligner) { alignment_tool.new(sequences) }

    it '#results' do
      expect(aligner.results.size).to eq(aligner.sequences.size)
    end

    it '#log is populated after running' do
      expect(aligner.log).to be_nil
      aligner.results
      expect(aligner.log).to_not be_empty
    end
  end
end
