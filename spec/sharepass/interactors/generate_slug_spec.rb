require 'spec_helper'

describe GenerateSlug do
  let(:repository) { instance_double('BookRepository') }

  it 'generates random strings' do
    expect(repository).to receive(:find_by_slug).twice.and_return(false)
    expect(described_class.new(repository: repository).call.slug)
      .not_to eq(described_class.new(repository: repository).call.slug)
  end
end
