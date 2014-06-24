class AddAdmin < ActiveRecord::Migration
  def change
    create_table :admins do |f|
      f.string :first_name, null: false
      f.string :last_name, null: false
      f.string :email, null: false
    end
  end
end
