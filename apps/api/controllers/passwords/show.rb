module Api::Controllers::Passwords
  class Show
    include Api::Action

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      shown = ShowPassword.new.call(slug: params[:id])

      create_transition(shown.password)

      halt 400, Api::Serializers::Errors.new(shown).to_json unless shown.success?

      status 200, Api::Serializers::ShownPassword.new(shown.password).to_json
    end

    private

    def create_transition(password)
      result = CreateTransition.new.call(password: password, request: request)

      halt 400, Api::Serializers::Errors.new(result).to_json unless result.success?
    end
  end
end
