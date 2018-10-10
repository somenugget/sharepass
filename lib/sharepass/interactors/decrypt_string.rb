require 'base64'

class DecryptString
  include Hanami::Interactor

  expose :decrypted

  def initialize(key: ENV['ENCRYPTION_KEY'])
    @key = Digest::SHA256.digest key
  end

  def call(encrypted:, iv:)
    decipher = OpenSSL::Cipher::AES256.new :CBC
    decipher.decrypt
    decipher.key = @key
    decipher.iv = Base64.decode64 iv

    @decrypted = decipher.update(Base64.decode64(encrypted)) + decipher.final
  end
end
