class RenameCohortMonths < ActiveRecord::Migration
  def change
    rename_column :cohorts, :start_month, :start_date
    rename_column :cohorts, :end_month, :end_date
  end
end
