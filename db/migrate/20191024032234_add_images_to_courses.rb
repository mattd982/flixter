class AddImagesToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :images, :string
  end
end
