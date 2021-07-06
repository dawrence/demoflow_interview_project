# frozen_string_literal: true

# Presentation Serializer class
class PresentationSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :start_at, :end_at, :active_slide_id, :presented_slides, :time_spent, :slides

  belongs_to :demo
  belongs_to :active_slide

  def slides
    object.demo&.slides
  end

  def time_spent
    return '' if object.start_at.blank? || object.end_at.blank?

    distance_of_time_in_words object.start_at, object.end_at
  end
end
