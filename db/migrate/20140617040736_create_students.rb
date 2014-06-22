class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |f|
      f.text :first_name
      f.text :last_name
      f.integer :cohort_id

      f.timestamps
    end
  end
end
