class CreateLeadRaws < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_raws do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: true
      for str in "aa".."cc"
        t.string "col_" + str
      end

      t.timestamps
    end
  end
end
