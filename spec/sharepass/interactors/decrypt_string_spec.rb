require 'spec_helper'

describe DecryptString do
  it 'decrypts string' do
    iv = "A\xAC\x1Fd\x00-\xCBbp\xDC\x18E*\xB2;\xD7"
    encrypted = "\xACK0\xD3g\x1E\xF0Ar\xE3\x1C]d\xE6\xBA\e"

    result = DecryptString.new.call(encrypted: encrypted, iv: iv)
    expect(result.decrypted).to eq('string')
  end
end
