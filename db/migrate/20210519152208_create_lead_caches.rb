class CreateLeadCaches < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_caches do |t|
      t.references :lead, null: false, foreign_key: true
      t.references :maker_group, null: false, foreign_key: true
      # (1..10).each do |i|
      #   t.string 'col_' + i.to_s
      # end

      t.text :index_cache
      t.text :show_cache

      t.timestamps
    end
  end
end
