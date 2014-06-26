class RenameStudentsColumns < ActiveRecord::Migration
  def change
    rename_column :students, :github_url, :github
    rename_column :students, :linkedin_url, :linkedin
    rename_column :students, :stackoverflow_url, :stackoverflow
  end
end
