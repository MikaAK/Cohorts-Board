class AddStudentSocialMedia < ActiveRecord::Migration
  def change
    add_column :students, :github_url, :string
    add_column :students, :linkedin_url, :string
    add_column :students, :stackoverflow_url, :string
  end
end
