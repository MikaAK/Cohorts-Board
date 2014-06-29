class ChangeCohortsDates < ActiveRecord::Migration
  def change
    change_column :cohorts, :start_date, :date
    change_column :cohorts, :end_date, :date
  end
end
