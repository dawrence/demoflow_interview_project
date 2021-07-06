# frozen_string_literal: true

# Demo Serializer class
class DemoSerializer < ActiveModel::Serializer
  attributes :id, :title, :slides

  has_many :slides
end
