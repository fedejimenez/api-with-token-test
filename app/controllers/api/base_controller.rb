# frozen_string_literal: false

module Api
  # :nodoc:
  class BaseController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    before_action :authenticate

    private

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        env_token = ENV.fetch(options['api_key'] || '', '')

        ActiveSupport::SecurityUtils.secure_compare(token, env_token)
      end
    end
  end
end
