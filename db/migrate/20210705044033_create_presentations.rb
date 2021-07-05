# frozen_string_literal: true

# Migration for Presentations
class CreatePresentations < ActiveRecord::Migration[6.0]
  def change
    create_table :presentations do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :demo, foreign_key: true, null: false
      t.integer :active_slide_id, null: true

      t.json :presented_slides, default: []

      t.timestamps
    end

    add_index :presentations, :active_slide_id
  end
end
