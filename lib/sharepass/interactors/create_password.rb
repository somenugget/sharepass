class CreatePassword
  include Hanami::Interactor

  expose :password

  def initialize(repository: PasswordRepository.new,
                 generate_salt: GenerateSalt.new,
                 generate_slug: GenerateSlug.new,
                 encrypt_string: EncryptString.new)
    @repository     = repository
    @generate_salt  = generate_salt
    @generate_slug  = generate_slug
    @encrypt_string = encrypt_string
  end

  def call(password_attributes)
    salt = @generate_salt.call
    slug = @generate_slug.call
    encrypted = @encrypt_string.call(string: password_attributes[:value], salt: salt)

    @password = @repository.create(encrypted: encrypted, salt: salf, slug: slug)
  end
end
