# frozen_string_literal: true

# Presentation
class Presentation < ApplicationRecord
  belongs_to :demo
  belongs_to :active_slide, class_name: 'Slide'
end
