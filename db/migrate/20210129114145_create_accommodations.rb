# frozen_string_literal: true

class CreateAccommodations < ActiveRecord::Migration[6.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.integer :rooms
      t.text :description
      t.string :city

      t.timestamps
    end
  end
end
