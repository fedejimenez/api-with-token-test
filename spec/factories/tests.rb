# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    bk_organization_id { 1 }
    source_uuid { 'abc123' }
    # transactions_summarized_count { 5 }
    # summarized_net_sales { 1000.2 }
    # journal_entry_template { 'journal' }
    # json_diff { 'json_diff' }
    # connection_id { 'connection_id' }
    # short_summary { 'short_summary' }
    # source_raw_data { 'source_raw_data' }
    # apify_run_url { 'apifu_run_url' }
    # bk_external_id { 10 }
    post_raw_data do
      {
        field1: 'value 1',
        field2: {
          field2a: 'value_2_a',
          field2b: 'value_2_b'
        }
      }
    end
    status { 'status' }
  end
end
