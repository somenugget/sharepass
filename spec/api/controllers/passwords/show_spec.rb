RSpec.describe Api::Controllers::Passwords::Show, type: :action do
  let(:action) { described_class.new }

  context 'password was not shown before' do
    let(:password) { CreatePassword.new.call(value: '12345').password }
    it 'is successful' do
      status, _headers, body = action.call id: password.slug, 'REMOTE_ADDR' => '127.1.1.1'
      body = JSON.parse(body.first)

      expect(status).to eq 200
      expect(body['password']).to eq '12345'
    end
  end

  context 'password is already shown before' do
    let(:password) do
      password = PasswordRepository.new.create(encrypted: '1', iv: '1', slug: '1')
      TransitionRepository.new.create(password_id: password.id, ip: '127.0.0.1')
      password
    end

    it 'returns error' do
      status, _headers, body = action.call id: password.slug, 'REMOTE_ADDR' => '127.1.1.1'
      body = JSON.parse(body.first)

      expect(status).to eq(400)
      expect(body['errors']).to contain_exactly('Password was already shown!')
    end

    it 'stores invalid transition' do
      action.call id: password.slug, 'REMOTE_ADDR' => '127.1.1.1'
      transitions = TransitionRepository.new.all

      expect(transitions.size).to eq(2)
      expect(transitions.select { |t| t.ip == '127.1.1.1' }).not_to be_nil
    end
  end
end
