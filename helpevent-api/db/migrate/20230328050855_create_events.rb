class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.decimal :total_price
      t.datetime :event_data

      t.timestamps
    end
  end
end
