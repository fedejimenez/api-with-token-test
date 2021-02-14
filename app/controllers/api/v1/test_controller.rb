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
        params.require(:test).permit(:bk_organization_id,
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
                                       :realm_id,
                                       { shipping: [:amount] },
                                       { discounts:
                                         [:amount, { subcategories: %i[label amount] }] },
                                       :docnumber,
                                       :api_version,
                                       { gross_sales:
                                         [:amount, { subcategories: %i[label amount] }] },
                                       :build_number,
                                       :bk_external_id,
                                       { gift_card_sales: [:amount] },
                                       :je_private_note,
                                       { manual_payments:
                                         [:amount, { subcategories: %i[label amount] }] },
                                       { paypal_payments: [:amount] },
                                       { stripe_payments_clearing: [:amount] },
                                       { shopify_payments:
                                         [:amount, { subcategories: %i[label amount] }] },
                                       { unknown_payments: [:amount] },
                                       { gift_tender_total: [:amount] },
                                       :source_report_url,
                                       { gratuity_collected: [:amount] },
                                       { sales_tax_collected:
                                         [:amount, { subcategories: %i[label amount] }] },
                                       { third_party_gateway_payments:
                                         [:amount, { subcategories: %i[label amount] }] }
                                     ])
      end
    end
  end
end
