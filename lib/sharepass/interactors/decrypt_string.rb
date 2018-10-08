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
    decipher.iv = iv

    @decrypted = decipher.update(encrypted) + decipher.final
  end
end
