class AddCohortImageUrl < ActiveRecord::Migration
  def change
    add_column :cohorts, :image_url, :string
  end
end
