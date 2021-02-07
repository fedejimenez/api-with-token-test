# frozen_string_literal: false

module Api
  module V1
    class TestController < BaseController
      def update
        render json: { message: 'update endpoint' }
      end

      def create
        render json: { message: 'create endpoint' }
      end
    end
  end
end
