class CreateEventItems < ActiveRecord::Migration[7.0]
  def change
    create_table :event_items do |t|
      t.integer :status
      t.integer :quantities
      t.references :event, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
