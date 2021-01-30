class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 50
      t.string :password_digest
      t.string :email
      t.boolean :admin_role, default: false
      t.boolean :user_role, default: true

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true

     ## Initialize first account:
     User.create! do |u|
      u.email             = 'admin@cool-accommodations.com'
      u.username          = 'admin'
      u.admin_role        = true
      u.user_role         = true
      u.password          = 'admin123456'
    end
  end
end
