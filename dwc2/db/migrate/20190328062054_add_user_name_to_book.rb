class AddUserNameToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_name, :integer
  end
end
