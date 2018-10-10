module Api::Controllers::Passwords
  class Show
    include Api::Action

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      password = PasswordRepository.new.find_by_slug(params[:id])
      if password.nil?
        self.body = { error: 'Wrong url' }
        self.status = 404
        return
      end

      decryption_result = DecryptString.new.call(encrypted: password.encrypted, iv: password.iv)

      if decryption_result.success?
        self.body = { password: decryption_result.decrypted }
        self.status = 200
      else
        self.body = { error: 'Smth wrong' }
        self.status = 400
      end
    end
  end
end
