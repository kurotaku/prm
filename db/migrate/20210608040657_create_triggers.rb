class CreateTriggers < ActiveRecord::Migration[6.1]
  def change
    create_table :triggers do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.integer :trigger_type
      t.string :trigger_attribute_name
      t.string :trigger_attribute_value

      t.timestamps
    end
  end
end
