class BatchCreatePassword
  include Hanami::Interactor

  expose :passwords

  def initialize(create_password:)
    @create_password = create_password
    @passwords = []
  end

  def call(passwords:)
    PasswordRepository.new.transaction do
      passwords.each do |password_params|
        result = @create_password.call value: password_params[:value],
                                       available_until: password_params[:available_until]

        if result.success?
          @passwords << result.password
        else
          error! result.errors.first
        end
      end
    end
  end
end
