# frozen_string_literal: true

# PresentationsController class
class PresentationsController < ApplicationController
  include ActionView::Helpers::DateHelper

  def create
    presentation = Presentation.create!(start_at: Time.zone.now, demo_id: demo.id)

    render json: presentation
  end

  def update
    update_active_slide! if safe_params[:active_slide_id].present?
    stop_presentation! if safe_params[:end_at].present?

    render json: presentation
  end

  def show
    render json: presentation
  end

  private

  def save_prev_presented_slide
    prev_active_slide = presentation.active_present_slide
    prev_active_slide['end_at'] = Time.zone.now
    prev_active_slide['time_spent'] = distance_of_time_in_words(prev_active_slide['start_at'], prev_active_slide['end_at'])
  end

  def save_active_present_slide
    active_present_slide = presentation.active_present_slide

    if active_present_slide.blank?
      presentation.presented_slides << { id: active_slide.id, start_at: Time.zone.now }
    else
      active_present_slide['start_at'] = Time.zone.now
    end
  end

  def update_active_slide!
    save_prev_presented_slide

    presentation.active_slide = active_slide
    save_active_present_slide

    presentation.save!
  end

  def stop_presentation!
    presentation.update_attributes!(end_at: Time.zone.now)
  end

  def presentation
    @presentation ||= Presentation.find_by(id: params[:id])
  end

  def active_slide
    @active_slide ||= Slide.find(safe_params[:active_slide_id])
  end

  def demo
    @demo ||= Demo.find_by(id: params[:demo_id])
  end

  def safe_params
    params.require(:presentation).permit(:end_at, :active_slide_id)
  end
end
