# frozen_string_literal: true

FactoryBot.define do
  factory :presentation do
    start_at { Time.zone.now }
    demo
  end
end
