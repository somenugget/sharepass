class CreateTransition
  include Hanami::Interactor

  expose :transition

  def initialize(repository: TransitionRepository.new)
    @repository = repository
  end

  def call(password:, request:)
    @transition = @repository.create(password_id: password.id, ip: request.ip)
  end
end
