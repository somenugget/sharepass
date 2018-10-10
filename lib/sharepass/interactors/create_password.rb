class CreatePassword
  include Hanami::Interactor

  expose :password

  def initialize(repository: PasswordRepository.new,
                 generate_slug: GenerateSlug.new,
                 encrypt_string: EncryptString.new)
    @repository     = repository
    @generate_slug  = generate_slug
    @encrypt_string = encrypt_string
  end

  def call(value:, available_until: nil)
    slug_result = @generate_slug.call
    result      = @encrypt_string.call(string: value)
    @password   = @repository.create(available_until: available_until,
                                     encrypted: result.encrypted,
                                     iv: result.iv,
                                     slug: slug_result.slug)
  end
end
