require 'spec_helper'

describe CreatePassword do
  let(:attributes) { { value: '12345', available_until: '11-11-2099' } }
  let(:repository) { instance_double('BookRepository') }

  it 'succeds' do
    expect(repository).to receive(:create)
    described_class.new(repository: repository).call(attributes)
  end
end
