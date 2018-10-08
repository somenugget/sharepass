RSpec.describe Api::Controllers::Passwords::Create, type: :action do
  let(:action) { described_class.new }

  describe 'creation of single password' do
    let(:params) { Hash[password: { value: '12345', available_until: '07-10-2018' }] }

    it 'creates password' do
      status, _headers, body = action.call(params)
      body = JSON.parse(body.first)

      expect(status).to eq 201
      expect(body).to have_key('url')
    end
  end

  describe 'invalid params' do
    it 'fails with empty password' do
      status, _headers, body = action.call({})
      body = JSON.parse(body.first)

      expect(status).to eq 422
      expect(body).to have_key('errors')
      expect(body['errors']).to eq(['Password is missing'])
    end
  end

  # it 'is successful' do
  #   response = action.call(params)
  #   expect(response[0]).to eq 200
  # end
end
