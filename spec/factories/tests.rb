# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    bk_organization_id { 1 }
    source_uuid { 'abc123' }
    transactions_summarized_count { 5 }
    summarized_net_sales { 1000.2 }
    journal_entry_template { 'journal' }
    json_diff { 'json_diff' }
    connection_id { 'connection_id' }
    short_summary { 'short_summary' }
    source_raw_data { 'source_raw_data' }
    apify_run_url { 'apifu_run_url' }
    bk_external_id { 10 }
    status { 'status' }
    post_raw_data do
      {
        inputs: {
          testing: false,
          location: '',
          shop_domain: '',
          qbo_realm_id: '',
          start_of_day: '2021-02-10T00:00:00-08:00',
          summary_date: '2021-02-10',
          bk_client_key: 'testing@bookkeep.com',
          bk_external_id: 3089,
          bk_organization_id: 'nO6vjoWQX1yL',
          journal_entry_template: 'test_template_name'
        },
        je_date: '2021-02-10',
        je_type: 'test_template_name',
        returns: {
          amount: 3149.04
        },
        currency: 'USD',
        realm_id: '193514313665607',
        shipping: {
          amount: 2388.9
        },
        discounts: {
          amount: 1103.89,
          subcategories: [
            {
              label: 'Other',
              amount: 1103.89
            }
          ]
        },
        docnumber: 'BKShopSum1002213089',
        api_version: '2020-02-04',
        gross_sales: {
          amount: 35_521.78,
          subcategories: [
            {
              label: 'Pyjamas',
              amount: 4196.6
            },
            {
              label: 'Slippers',
              amount: 741.77
            }
          ]
        },
        build_number: '0.1.383',
        bk_external_id: 3089,
        gift_card_sales: {
          amount: 75
        },
        je_private_note: 'Includes channels Online Store [BKJEID:166024]',
        manual_payments: {
          amount: 0,
          subcategories: []
        },
        paypal_payments: {
          amount: 9502.17
        },
        shopify_payments: {
          amount: 0,
          subcategories: [
            {
              label: 'Today Batch',
              amount: 0
            },
            {
              label: 'Tomorrow Batch',
              amount: 0
            }
          ]
        },
        unknown_payments: {
          amount: 28.53
        },
        gift_tender_total: {
          amount: 496.86
        },
        source_report_url: 'teststore.myshopify.com/admin/reports/finances?since=2021-02-10&until=2021-02-10',
        gratuity_collected: {
          amount: 0
        },
        sales_tax_collected: {
          amount: 1545.29,
          subcategories: [
            {
              rate: 0.01,
              label: 'US-TX-TX CITY TAX-1',
              state: 'TX',
              amount: 14.97,
              country: 'US',
              taxablesales: 1497
            },
            {
              rate: 0.0625,
              label: 'US-TX-TX STATE TAX-6.25',
              state: 'TX',
              amount: 167.32,
              country: 'US',
              taxablesales: 2677.12
            }
          ]
        },
        third_party_gateway_payments: {
          amount: 25_250.48,
          subcategories: [
            {
              label: 'firstdata_e4',
              amount: 15_263.72
            },
            {
              label: 'buy_now_pay_later_with_klarna',
              amount: 1465.22
            }
          ]
        }
      }
    end
  end
end
