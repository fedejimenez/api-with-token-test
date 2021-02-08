# frozen_string_literal: false

module Api
  module V1
    # :nodoc:
    class TestController < BaseController
      def create_or_update
        test = Test.find_by(source_uuid: params[:source_uuid])

        test ? update(test) : create
      end

      private

      def create
        test = Test.new(test_params)
        if test.save
          render json: test, status: :ok
        else
          render json: { error: test.errors.messages }, status: 422
        end
      end

      def update(test)
        if test.update(test_params)
          render json: test, status: :ok
        else
          render json: { error: test.errors.messages }, status: 422
        end
      end

      def test_params
        params.permit(:bk_organization_id,
                      :source_uuid,
                      :transactions_summarized_count,
                      :summarized_net_sales,
                      :journal_entry_template,
                      :json_diff,
                      :connection_id,
                      :short_summary,
                      :source_raw_data,
                      :apify_run_url,
                      :bk_external_id,
                      :status,
                      post_raw_data: [
                        :field1,
                        { field2: %i[
                          field2a
                          field2b
                        ] }
                      ])
      end
    end
  end
end
