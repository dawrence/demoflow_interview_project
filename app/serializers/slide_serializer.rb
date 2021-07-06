# frozen_string_literal: true

# Demo Serializer class
class SlideSerializer < ActiveModel::Serializer
  attributes :id, :content, :type
end
