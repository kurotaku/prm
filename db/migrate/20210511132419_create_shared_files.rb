class CreateSharedFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_files do |t|
      t.string :file
      t.string :file_name

      t.timestamps
    end
  end
end
