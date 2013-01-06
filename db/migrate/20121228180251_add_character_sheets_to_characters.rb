class AddCharacterSheetsToCharacters < ActiveRecord::Migration
  def up
    add_column :characters, :character_sheet_file_name, :string
    add_column :characters, :character_sheet_file_size, :integer
    add_column :characters, :character_sheet_content_type, :string
    add_column :characters, :character_sheet_updated_at, :datetime
  end
  def down
    remove_column :characters, :character_sheet_file_name
    remove_column :characters, :character_sheet_file_size
    remove_column :characters, :character_sheet_content_type
    remove_column :characters, :character_sheet_updated_at
  end
end
