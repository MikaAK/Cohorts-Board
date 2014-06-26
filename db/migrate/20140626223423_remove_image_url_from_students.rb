class RemoveImageUrlFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :image_url, :string
    add_column :students, :avatar, :string
  end
end
