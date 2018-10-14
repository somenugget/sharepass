require 'roar/decorator'
require 'roar/json'

module Api::Serializers
  class Errors < Roar::Decorator
    include Roar::JSON

    MESSAGES = %i[error_messages errors].freeze

    collection :errors, getter: (lambda do |options, **|
      MESSAGES.each do |message|
        return options[:represented].__send__(message) if options[:represented].respond_to? message
      end

      ['Unknown error']
    end)
  end
end
