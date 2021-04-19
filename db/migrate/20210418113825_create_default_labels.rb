class CreateDefaultLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :default_labels do |t|
      t.integer :order
      t.string :name

      t.timestamps
    end
  end
end
