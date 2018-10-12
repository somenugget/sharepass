require 'roar/decorator'
require 'roar/json'

module Api::Serializers
  class ShownPassword < Roar::Decorator
    include Roar::JSON

    property :password, getter: (lambda do |options, **|
      DecryptString.new
                   .call(encrypted: options[:represented].encrypted, iv: options[:represented].iv)
                   .decrypted
    end)
  end
end
