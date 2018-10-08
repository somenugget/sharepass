class GenerateSalt
  include Hanami::Interactor

  expose :salt

  def call
    @salt = SecureRandom.hex(8)
  end
end
