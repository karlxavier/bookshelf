class AddColumnImageToBook < ActiveRecord::Migration[6.1]
  def change
    column_exists?(:books, :image) || add_column(:books, :image, :string)
  end
end
