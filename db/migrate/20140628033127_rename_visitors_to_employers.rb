class RenameVisitorsToEmployers < ActiveRecord::Migration
  def change
    rename_table :visitors, :employers
  end
end
