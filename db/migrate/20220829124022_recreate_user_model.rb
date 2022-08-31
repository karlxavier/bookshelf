class RecreateUserModel < ActiveRecord::Migration[6.1]
  def change
    drop_table :users if table_exists? 'users'

    create_table :users, if_not_exists: true do |t|
      t.string      :name
      t.string      :email
      t.string      :password_digest
      t.timestamps
    end
  end
end
