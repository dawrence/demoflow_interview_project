# frozen_string_literal: true

# Migration for Slides
class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :type, null: false
      t.string :content
      t.references :demo, foreign_key: true, null: false
      t.timestamps
    end
  end
end
