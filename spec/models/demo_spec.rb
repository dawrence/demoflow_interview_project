# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Demo, type: :model do
  it { is_expected.to validate_presence_of(:title) }

  it { is_expected.to have_many(:slides) }
  it { is_expected.to have_many(:presentations) }
end
