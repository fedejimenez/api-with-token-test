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

      def test_params # rubocop:disable Metrics/MethodLength
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
                        :je_id,
                        { inputs: %i[
                          testing
                          location
                          channel_ids
                          shop_domain
                          qbo_realm_id
                          start_of_day
                          summary_date
                          bk_client_key
                          bk_external_id
                          channel_filter
                          bk_organization_id
                          journal_entry_template
                        ] },
                        :je_date,
                        :je_type,
                        { returns: [:amount] },
                        :currency,
                        :build_number,
                        :qbo_realm_id,
                        :bk_external_id,
                        :je_private_note,
                        :source_report_url,
                        { cost_of_goods_sold: [:amount] },
                        { inventory_reduction: [:amount] }
                      ])
      end
    end
  end
end
