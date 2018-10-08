require 'spec_helper'

describe EncryptString do
  it 'encrypts string' do
    result = EncryptString.new.call(string: 'string')
p result.iv
p result.encrypted
    expect(result.iv).to be_a(String)
    expect(result.encrypted).to be_a(String)
  end
end
