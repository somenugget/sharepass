require 'roar/decorator'
require 'roar/json'

class ErrorsRepresenter < Roar::Decorator
  include Roar::JSON

  collection :errors, getter: ->(options, **) { options[:represented].error_messages }
end
