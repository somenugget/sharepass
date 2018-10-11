describe BatchCreatePassword do
  let(:create_password) { instance_double('CreatePassword') }
  let(:passwords) do
    [
      { value: '12345', available_until: '11-11-2099' },
      { value: 'qwerty', available_until: '11-11-2099' }
    ]
  end

  it 'creates multiple passwords' do
    expect(create_password).to receive(:call)
      .with(passwords.first).and_return(double(success?: true, password: 'pass1'))
    expect(create_password).to receive(:call)
      .with(passwords.last).and_return(double(success?: true, password: 'pass2'))
    result = described_class.new(create_password: create_password).call(passwords: passwords)
    expect(result.passwords).to eq(%w[pass1 pass2])
  end
end
