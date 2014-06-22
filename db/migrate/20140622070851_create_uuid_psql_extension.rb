class CreateUuidPsqlExtension < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :visitors do |f|
      f.string :first_name
      f.string :last_name
      f.string :email
      f.integer :emails_sent
      f.uuid :uuid

      f.timestamps
    end
  end
end
