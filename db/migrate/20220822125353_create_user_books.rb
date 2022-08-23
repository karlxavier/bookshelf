class CreateUserBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_books do |t|
      t.references :user, null: false
      t.references :book, null: false
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
