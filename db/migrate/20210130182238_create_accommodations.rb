class CreateAccommodations < ActiveRecord::Migration[6.1]
  def change
    create_table :accommodations do |t|
      t.string :name, limit: 200
      t.float :price, default: 5
      t.string :city, limit: 100
      t.text :description, limit: 5000
      t.references :user, null: false, foreign_key: true
      t.integer :rooms, default: 1

      t.timestamps
    end
    add_index :accommodations, :name, unique: true

    ## Initialize first accommodation:
    Accommodation.create! do |acc|
      acc.name             = 'nezaGuest'
      acc.price          = 1299.99
      acc.city        = 'Gisenyi'
      acc.description         = 'Cool place to stay while in your holiday, it\'s near the lake Kivu'
      acc.user          = User.first
      acc.rooms          = 10
    end
  end
end
