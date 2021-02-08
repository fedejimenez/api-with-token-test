# frozen_string_literal: false

# :nodoc:
class Test < ApplicationRecord
  # Validations
  validates :source_uuid, presence: true
  validates :post_raw_data, presence: true
end
