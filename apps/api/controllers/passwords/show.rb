module Api::Controllers::Passwords
  class Show
    include Api::Action

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      password = find_password(params[:id])
      halt 404, { error: ['Password not found'] }.to_json unless password

      status 200, Api::Serializers::ShownPassword.new(password).to_json
    end

    private

    def find_password(slug)
      PasswordRepository.new.find_by_slug(params[:id])
    end

    def not_found_message
    end
  end
end
