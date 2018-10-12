RSpec.describe Api::Controllers::Passwords::Show, type: :action do
  let(:action) { described_class.new }
  let(:password) { CreatePassword.new.call(value: '12345').password }

  it 'is successful' do
    status, _headers, body = action.call id: password.slug
    body = JSON.parse(body.first)

    expect(status).to eq 200
    expect(body['password']).to eq '12345'
  end
end
