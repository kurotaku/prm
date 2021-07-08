# frozen_string_literal: true

class CreateNotificationReads < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_reads do |t|
      t.references :notification, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
