class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :trip_name
      t.integer :likes

      t.timestamps
    end
  end
end
