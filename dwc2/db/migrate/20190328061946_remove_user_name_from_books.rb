class RemoveUserNameFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :user_name, :varchar
  end
end
