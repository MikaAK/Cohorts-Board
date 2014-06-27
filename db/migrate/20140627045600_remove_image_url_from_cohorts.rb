class RemoveImageUrlFromCohorts < ActiveRecord::Migration
  def change
    remove_column :cohorts, :image_url, :string
  end
end
