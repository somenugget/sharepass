require 'base64'

class EncryptString
  include Hanami::Interactor

  expose :encrypted, :iv

  def initialize(key: ENV['ENCRYPTION_KEY'])
    @key = Digest::SHA256.digest key
  end

  def call(string:)
    cipher = OpenSSL::Cipher::AES256.new :CBC
    cipher.encrypt
    cipher.key = @key

    # use Base64 to be able to store encrypted value to database
    @iv = Base64.encode64(cipher.random_iv)
    @encrypted = Base64.encode64(cipher.update(string) + cipher.final)
  end
end
