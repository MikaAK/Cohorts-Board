class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :cities_to_work, :string
    add_column :students, :developer_role, :string
    add_column :students, :city_from, :string
    add_column :students, :personal_website_url, :string
  end
end
