module Braintree
  class TokenGenerator
    def call
      @getway.client_token.generate
    end
  end
end