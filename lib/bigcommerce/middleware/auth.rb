# frozen_string_literal: true

module Bigcommerce
  module Middleware
    class Auth < Faraday::Middleware
      X_AUTH_CLIENT_HEADER = 'X-Auth-Client'
      X_AUTH_TOKEN_HEADER = 'X-Auth-Token'

      def initialize(app, options = {})
        super(app)
        @options = options
      end

      def on_request(env)
        env[:request_headers][X_AUTH_CLIENT_HEADER] = @options[:client_id]
        env[:request_headers][X_AUTH_TOKEN_HEADER] = @options[:access_token]
        @app.call(env)
      end
    end
  end
end
