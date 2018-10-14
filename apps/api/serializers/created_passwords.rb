require 'roar/decorator'
require 'roar/json'

module Api::Serializers
  class CreatedPasswords < Roar::Decorator
    include Roar::JSON

    collection :passwords,
               decorator: Api::Serializers::CreatedPassword,
               getter: ->(options, **) { options[:represented] }
  end
end
