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

    @iv = cipher.random_iv
    @encrypted = cipher.update(string) + cipher.final
  end
end
