RSpec.describe Api::Serializers::CreatedPassword, type: :serializer do
  let(:password) { PasswordRepository.new.create(slug: '1', encrypted: '1', iv: '1') }

  it 'creates json with "url"' do
    expect(described_class.new(password).to_json).to eq "{\"url\":\"http://0.0.0.0:2300/passwords/1\"}"
  end
end
