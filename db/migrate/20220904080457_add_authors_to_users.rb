class AddAuthorsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :author, :string
  end
end
