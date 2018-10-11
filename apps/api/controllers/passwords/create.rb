module Api::Controllers::Passwords
  class Create
    include Api::Action

    params do
      required(:password).schema(Api::Validations::CreatePassword)
    end

    def call(params)
      if params.valid?
        result = CreatePassword.new.call(params[:password])
        self.status = 201
        self.body = { url: Api.routes.url(:password, id: result.password.slug) }
      else
        self.body = ErrorsRepresenter.new(params).to_json
        self.status = 422
      end
    end
  end
end
