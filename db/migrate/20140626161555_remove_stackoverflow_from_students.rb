class RemoveStackoverflowFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :stackoverflow
  end
end
