class AddImageColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :image_url, :string
  end
end
