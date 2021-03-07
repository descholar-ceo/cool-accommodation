class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :email

      t.timestamps
    end
    add_index :users, :email, unique: true

     ## Initialize first account:
     User.create! do |u|
      u.email             = 'admin@cool-accommodations.com'
      u.password          = 'admin123456'
    end
  end
end
