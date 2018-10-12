require 'roar/decorator'
require 'roar/json'

module Api::Serializers
  class CreatedPassword < Roar::Decorator
    include Roar::JSON

    property :url, getter: ->(options, **) { Api.routes.url(:password, id: options[:represented].slug) }
  end
end
