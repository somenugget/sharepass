module Api::Controllers::Passwords
  class Create
    include Api::Action

    params do
      required(:password).schema do
        required(:value).filled(:str?)
        optional(:available_until)
      end
    end

    def call(params)
      if params.valid?
        result = CreatePassword.new.call(params: params)
        self.status = 201
        self.body = '{"url": "ddd"}'
      else
        self.body = ErrorsRepresenter.new(params).to_json
        self.status = 422
      end
    end
  end
end
