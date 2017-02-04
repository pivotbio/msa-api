#!/usr/bin/env ruby

require 'tempfile'
require 'json'

require 'bundler'
Bundler.require

require './lib/sequence.rb'
require './lib/multiple_sequence_alignment.rb'

#
# accepts JSON array of sequences in the following format:
#
# {
#   'sequences': [
#     { id: 1, body: 'CCCCTTTTGGGGAAAA' },
#     { id: 2, body: 'CCCCTTTGGGGAAAA' }
#   ]
# }
#
# runs a multiple sequence alignment and returns the sequences in a similar
# format:
#
# {
#   'sequences': [
#     { id: 1, body: 'CCCCTTTTGGGGAAAA' },
#     { id: 2, body: '-CCCCTTTGGGGAAAA' }
#   ],
#   'log': '....'
# }
#


class MSAAPI < Sinatra::Base

  before do
    content_type 'application/json'
  end

  set :bind, '0.0.0.0'

  get '/' do
    'MSA API'
  end

  post '/' do
    params = JSON.parse(request.body.read)
    $stderr.puts params
    sequences = params['sequences'].map { |sequence| Sequence.new(sequence['id'], sequence['body']) }
    msa = MultipleSequenceAlignment.new(sequences)
    {
      'sequences': msa.results.map(&:to_h),
      'log': msa.log
    }.to_json
  end

end
