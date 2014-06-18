class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.datetime :start_month
      t.datetime :end_month

      t.timestamps
    end
  end
end
