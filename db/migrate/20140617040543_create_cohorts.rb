class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |f|
      f.datetime :start_month
      f.datetime :end_month

      f.timestamps
    end
  end
end
