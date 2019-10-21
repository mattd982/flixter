class AddPictureToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :picture, :string
  end
end
