class AddRegisteredToStudents < ActiveRecord::Migration
  def change
    add_column :students, :registered, :boolean, default: false
  end
end
