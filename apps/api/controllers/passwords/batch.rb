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
        result = BatchCreatePassword.new(create_password: CreatePassword.new)
                                    .call(passwords: params[:passwords])

        render_result(result)
      else
        status 422, ErrorsRepresenter.new(params).to_json
      end
    end

    private

    def render_result(result)
      if result.success?
        status 201, Api::Serializers::CreatedPasswords.new(result.passwords).to_json
      else
        status 422, ErrorsRepresenter.new(result).to_json
      end
    end
  end
end
