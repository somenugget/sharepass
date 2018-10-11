RSpec.describe Api::Controllers::Passwords::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[password: { value: '12345', available_until: '07-10-2018' }] }

  it 'creates password' do
    status, _headers, body = action.call(params)
    repository = PasswordRepository.new

    expect(status).to eq 201
    expect(body[:url]).to eq Api.routes.url(:password, id: repository.last.slug)
  end

  it 'fails with empty password' do
    status, _headers, body = action.call({})
    body = JSON.parse(body.first)

    expect(status).to eq 422
    expect(body).to have_key('errors')
    expect(body['errors']).to eq(['Password is missing'])
  end
end
