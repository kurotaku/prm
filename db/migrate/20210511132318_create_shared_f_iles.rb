class CreateSharedFIles < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_f_iles do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :uuid
      t.string :file
      t.string :file_name
      t.string :title
      t.string :human_size
      t.integer :file_size
      
      t.timestamps
    end
  end
end
