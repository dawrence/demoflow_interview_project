# frozen_string_literal: true

# Presentation
class Presentation < ApplicationRecord
  belongs_to :demo
  belongs_to :active_slide, class_name: 'Slide'

  before_validation :set_active_slide, on: [:create]

  def set_active_slide
    self.active_slide_id = demo.slides.first.id
    presented_slides << { id: demo.slides.first.id, start_at: Time.zone.now }
  end

  def active_present_slide
    present_slide(active_slide_id)
  end

  def present_slide(slide_id)
    presented_slides.select { |slide| slide['id'] == slide_id }.first
  end
end
