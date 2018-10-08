class GenerateSlug
  include Hanami::Interactor

  expose :slug

  def initialize(repository: PasswordRepository.new)
    @repository = repository
  end

  def call
    loop do
      @slug = SecureRandom.hex(8)
      break unless @repository.find_by_slug(@slug)
    end
  end
end
