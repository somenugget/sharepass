module Api::Validations
  class CreatePassword
    include Hanami::Validations

    validations do
      required(:value).filled(:str?)
      optional(:available_until)
    end
  end
end

