class AddBioToStudents < ActiveRecord::Migration
  def change
    add_column :students, :bio, :text
  end
end
