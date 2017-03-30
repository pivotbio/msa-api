class Sequence
  attr_reader :id, :body

  def initialize id, body
    @id = id
    @body = body
  end

  def as_fasta
    ">#{id}\n#{body}\n"
  end

  def to_h
    { id: id, body: body }
  end
end
