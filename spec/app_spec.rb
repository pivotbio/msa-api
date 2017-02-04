require 'spec_helper'

describe 'MSAAPI' do
  let(:params) {
    {
      sequences: [
      { id: 1, body: 'CCCCTTTTGGGGAAAA' },
      { id: 2, body: 'CCCCTTTGGGGAAAA' }
      ]
    }
  }

  it 'posting to / should generate a multiple sequencing alignment' do
    post '/', params
    expect(last_response).to be_ok
    data = JSON.parse(last_response.body)
    expect(data['sequences']).to be_a(Array)
    expect(data['log']).to be_a(String)
  end
end
