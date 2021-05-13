class CreateDownloadFileHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :download_file_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shared_file, null: false, foreign_key: true
      t.string :uid

      t.timestamps
    end
  end
end
