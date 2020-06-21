class AddMetadataToHits < Sequel::Migration
  def up
    alter_table :hits do
      add_column :country, String
      add_column :region, String
      add_column :city, String
      add_column :device, String
      add_column :os, String

      add_constraint(:valid_country) { char_length(:country) <= 2 }
      add_constraint(:valid_region) { char_length(:region) < 64 }
      add_constraint(:valid_city) { char_length(:city) < 64 }
      add_constraint(:valid_device) { char_length(:device) < 32 }
      add_constraint(:valid_os) { char_length(:os) < 32 }
    end
  end

  def down
    alter_table :hits do
      drop_column :country
      drop_column :region
      drop_column :city
      drop_column :device
      drop_column :os
    end
  end
end
