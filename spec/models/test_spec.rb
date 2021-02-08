# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test, type: :model do
  # Validation tests
  # ensure column source_uuid is present before saving

  it { is_expected.to validate_presence_of(:source_uuid) }
end
