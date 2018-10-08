require 'spec_helper'

describe GenerateSalt do
  it 'generates random strings' do
    expect(described_class.new.call.salt).not_to eq(described_class.new.call.salt)
  end
end
