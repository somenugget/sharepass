require 'roar/decorator'
require 'roar/json'

module Api::Serializers
  class Errors < Roar::Decorator
    include Roar::JSON

    collection :errors, getter: ->(options, **) { options[:represented].error_messages }
  end
end
