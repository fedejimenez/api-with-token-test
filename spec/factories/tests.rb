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
    post_raw_data do
      {
        je_id: 'jet_id',
        inputs: {
          testing: '',
          location: 'location',
          channel_ids: ['CHANNEL_!'],
          shop_domain: 'testdomain.com',
          qbo_realm_id: 'realm_id',
          start_of_day: '2020-12-22T00:00:00-08:00',
          summary_date: '2020-12-22',
          bk_client_key: 'client_key',
          bk_external_id: 1234,
          channel_filter: 'filter',
          bk_organization_id: 'organization_id',
          journal_entry_template: 'journal'
        },
        je_date: '2021-02-04',
        je_type: 'je_type',
        returns: {
          amount: 0
        },
        currency: 'USD',
        build_number: '0.0.1',
        qbo_realm_id: 'realml_id',
        bk_external_id: 1234,
        je_private_note: 'this is a private note',
        source_report_url: 'reporturl.com',
        cost_of_goods_sold: {
          amount: 0
        },
        inventory_reduction: {
          amount: 0
        }
      }
    end
    status { 'status' }
  end
end
