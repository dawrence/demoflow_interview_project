# frozen_string_literal: true

FactoryBot.define do
  factory :slide do
    content { 'slide' }
    demo

    trait :web do
      type { 'WebSlide' }
      content { 'WebSlide' }
    end

    trait :html do
      type { 'HtmlSlide' }
      content { 'HtmlSlide' }
    end

    trait :image do
      type { 'ImageSlide' }
      content { 'ImageSlide' }
    end
  end
end
