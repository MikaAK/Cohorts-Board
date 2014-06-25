class AddEmailStudents < ActiveRecord::Migration
  def change
    add_column :students, :email, :string, null: false
  end
end
