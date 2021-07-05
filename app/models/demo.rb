# frozen_string_literal: true

# Demo Class
class Demo < ApplicationRecord
  has_many :slides
  has_many :presentations

  validates :title, presence: true
end
