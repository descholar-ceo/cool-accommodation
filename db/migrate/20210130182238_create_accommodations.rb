class CreateAccommodations < ActiveRecord::Migration[6.1]
  def change
    create_table :accommodations do |t|
      t.string :name, limit: 200
      t.float :price, default: 5
      t.text :description, limit: 5000
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :accommodations, :name, unique: true
  end
end
