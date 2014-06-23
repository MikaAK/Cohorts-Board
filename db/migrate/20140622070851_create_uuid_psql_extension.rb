class CreateUuidPsqlExtension < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :visitors do |f|
      f.string :first_name, null: false
      f.string :last_name
      f.string :email
      f.integer :emails_sent
      f.uuid :uuid, null: false, default: "uuid_generate_v4()"

      f.timestamps
    end
  end
end
