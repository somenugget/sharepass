class ShowPassword
  include Hanami::Interactor

  expose :password, :decrypted

  def initialize(repository: PasswordRepository.new,
                 decrypt_string: DecryptString.new)
    @repository = repository
    @decrypt_string = decrypt_string
  end

  def call(slug:)
    @password = find_password(slug)

    error! 'Password was already shown!' unless @password.transitions.empty?

    @decrypted = @decrypt_string.call(encrypted: @password.encrypted, iv: @password.iv)
                                .decrypted
  end

  def find_password(slug)
    password = @repository.find_by_slug_with_transitions(slug)

    error! 'Can\'t find password!' unless password
    error! 'Password is expired!' if password.expired?

    password
  end
end
