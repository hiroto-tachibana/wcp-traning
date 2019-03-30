class AddPostImageIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :post_image_id, :integer
  end
end
