class AddUuidToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :uuid, :uuid, default: "uuid_generate_v4()"
  end
end
