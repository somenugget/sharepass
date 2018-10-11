RSpec.describe Api::Controllers::Passwords::Batch, type: :action do
  let(:action) { described_class.new }
  let(:params) do
    { passwords: [
      { value: '12345', available_until: '07-10-2018' },
      { value: 'string', available_until: '07-11-2018' }
    ] }
  end

  it 'creates password' do
    status, _headers, body = action.call(params)
    expect(status).to eq 201

    passwords = PasswordRepository.new.all.last(2)

    expect(body.first[:url]).to eq Api.routes.url(:password, id: passwords.first.slug)
    expect(body.last[:url]).to eq Api.routes.url(:password, id: passwords.last.slug)
  end
end
