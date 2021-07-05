# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Presentation, type: :model do
  it { is_expected.to belong_to(:demo) }
  it { is_expected.to belong_to(:active_slide) }
end
