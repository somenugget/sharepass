module Api::Controllers::Passwords
  class Show
    include Api::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
