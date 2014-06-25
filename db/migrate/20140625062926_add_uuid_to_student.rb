class AddUuidToStudent < ActiveRecord::Migration
  def change
    add_column :students, :uuid, :uuid, default: "uuid_generate_v4()"
  end
end
