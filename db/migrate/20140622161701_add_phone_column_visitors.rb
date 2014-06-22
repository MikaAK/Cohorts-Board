class AddPhoneColumnVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :phone_number, :integer
  end
end
