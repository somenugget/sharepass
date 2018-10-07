module Api::Controllers::Passwords
  class Create
    include Api::Action

    def call(params)
      self.status = 201
      self.body = '{"url": "ddd"}'
    end
  end
end
