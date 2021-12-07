module Braintree
  class TokenGenerator
    def initializ(mode: 'sandbox', merchat_id: nil, public_key: nil, private_key: nil)
      @merchant_id = merchant_id || ENV['braintree_merchant_id']
      @public_key = public_key ||
      @private_key = private_key ||
    end
  end
end