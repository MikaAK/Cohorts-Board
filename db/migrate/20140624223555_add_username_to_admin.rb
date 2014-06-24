class AddUsernameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :user_name, :string, null: false
  end
end
