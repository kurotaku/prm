class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.string :code
      t.string :name
      t.integer :status, default: 10, null: false

      t.timestamps
    end
  end
end
