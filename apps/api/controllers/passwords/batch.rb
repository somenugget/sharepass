module Api::Controllers::Passwords
  class Batch
    include Api::Action

    params do
      required(:passwords).each do
        schema(Api::Validations::CreatePassword)
      end
    end

    def call(params)
      if params.valid?
        result = BatchCreatePassword.new(create_password: CreatePassword.new).call(passwords: params[:passwords])
        self.status = 201
        self.body = result.passwords.map do |password|
          { url: Api.routes.url(:password, id: password.slug) }
        end
      else
        status 422, ErrorsRepresenter.new(params).to_json
      end
    end
  end
end
