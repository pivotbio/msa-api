require 'open3'

class MultipleSequenceAlignment
  attr_reader :sequences, :log

  def initialize sequences
    @sequences = sequences
    write_sequences!
  end

  def results
    @results ||= run_alignment!
  end

  private

  def alignment_file
    @alignment_file ||= Tempfile.new('alignment')
  end

  def sequences_file
    @sequences_file ||= Tempfile.new('fasta')
  end

  def write_sequences!
    File.open(sequences_file.path, 'w') do |handle|
      sequences.each do |sequence|
        handle.write(sequence.as_fasta)
      end
    end
  end
end

class Clustalw < MultipleSequenceAlignment
  private

  def run_alignment!
    cmd = "clustalw2 -infile=#{sequences_file.path} -outfile=#{alignment_file.path} -output=FASTA"

    @log = Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      stdout.read
    end

    Dna.new(File.open(alignment_file.path), format: :fasta).map do |record|
      Sequence.new(record.name, record.sequence)
    end
  end
end

class Muscle < MultipleSequenceAlignment
  private

  def run_alignment!
    cmd = "muscle -in #{sequences_file.path} -out #{alignment_file.path}"

    @log = Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      stderr.read
    end

    Dna.new(File.open(alignment_file.path), format: :fasta).map do |record|
      Sequence.new(record.name, record.sequence)
    end
  end
end
