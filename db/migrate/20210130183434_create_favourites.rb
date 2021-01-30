class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true

      t.timestamps
    end

    ## Initialize first fovourite:
    Favourite.create! do |fav|
      fav.user             = User.first
      fav.accommodation          = Accommodation.first
    end
  end
end
