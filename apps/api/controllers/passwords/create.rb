module Api::Controllers::Passwords
  class Create
    include Api::Action

    params do
      required(:password).schema(Api::Validations::CreatePassword)
    end

    def call(params)
      if params.valid?
        result = CreatePassword.new.call(params[:password])
        status 201, Api::Serializers::CreatedPassword.new(result.password).to_json
      else
        status 422, Api::Serializers::Errors.new(params).to_json
      end
    end
  end
end
