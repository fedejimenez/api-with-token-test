# frozen_string_literal: false

module Api
  module V1
    # :nodoc:
    class TestController < BaseController
      def create_or_update
        byebug
        
        render json: { message: 'create endpoint' }
      end
    end
  end
end
