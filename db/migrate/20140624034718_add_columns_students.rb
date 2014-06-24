class AddColumnsStudents < ActiveRecord::Migration
  def change
    remove_column :visitors, :cohort_id
    remove_column :visitors, :emails_sent
    add_column :students, :short_bio, :string
  end
end
