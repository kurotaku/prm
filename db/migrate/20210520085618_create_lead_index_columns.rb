class CreateLeadIndexColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_index_columns do |t|

      t.timestamps
    end
  end
end
