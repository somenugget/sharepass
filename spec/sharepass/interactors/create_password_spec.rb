require 'spec_helper'

describe CreatePassword do
  let(:attributes) { { value: '12345', available_until: '11-11-2099' } }
  let(:repository) { instance_double('BookRepository') }

  it 'succeds' do
    generate_slug = instance_double('GenerateSlug')
    encrypt_string = instance_double('EncryptString')

    expect(generate_slug).to receive(:call).and_return('1')
    expect(encrypt_string).to receive(:call).with(string: attributes[:value])
                                            .and_return(double(encrypted: '2', iv: '3'))
    expect(repository).to receive(:create).with(available_until: attributes[:available_until],
                                                encrypted: '2',
                                                iv: '3',
                                                slug: '1')

    described_class.new(repository: repository,
                        generate_slug: generate_slug,
                        encrypt_string: encrypt_string).call(attributes)
  end
end
