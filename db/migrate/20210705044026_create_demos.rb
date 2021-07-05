# frozen_string_literal: true

# Migration for Demos
class CreateDemos < ActiveRecord::Migration[6.0]
  def change
    create_table :demos do |t|
      t.string :title, null: false, default: ''

      t.timestamps
    end
  end
end
