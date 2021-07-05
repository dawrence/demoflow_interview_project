# frozen_string_literal: true

# Slide
class Slide < ApplicationRecord
  belongs_to :demo

  validates :type, presence: true
end
