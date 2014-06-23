class AddCohortIdToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :cohort_id, :integer
  end
end
