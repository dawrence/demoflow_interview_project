# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Slide, type: :model do
  it { is_expected.to belong_to(:demo) }

  it { is_expected.to validate_presence_of(:type) }

  [WebSlide, HtmlSlide, ImageSlide].each do |slide_class|
    it "Creates a #{slide_class.to_s.titleize}" do
      slide = slide_class.new
      expect(slide.print).to include(slide_class.to_s)
    end
  end
end
