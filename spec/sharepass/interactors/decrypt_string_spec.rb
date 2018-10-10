require 'spec_helper'

describe DecryptString do
  it 'decrypts string' do
    # "string" encrypted with key WB2zkXLrqUOg6tA2gzL3Q5B1X1jnWuhw
    iv = "vPoArGoFT5D9ijucXmM66g==\n"
    encrypted = "LBXbOipAZ5OOjspZVcIumQ==\n"

    result = DecryptString.new.call(encrypted: encrypted, iv: iv)
    expect(result.decrypted).to eq('string')
  end
end
