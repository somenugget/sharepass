require 'spec_helper'

describe ShowPassword do
  context 'password is not shown before' do
    let(:password) { PasswordRepository.new.create(encrypted: '1', iv: '1', slug: '1') }

    it 'shows password' do
      result = described_class.new(decrypt_string: double(call: double(decrypted: '1')))
                              .call(slug: password.slug)

      expect(result).to be_a_success
    end
  end

  context 'password is already shown' do
    let(:password) do
      password = PasswordRepository.new.create(encrypted: '1', iv: '1', slug: '1')
      TransitionRepository.new.create(password_id: password.id, ip: '127.0.0.1')
      password
    end

    it 'fails' do
      result = described_class.new.call(slug: password.slug)

      expect(result).not_to be_a_success
      expect(result.errors).to eq(['Password was already shown!'])
    end
  end
end
