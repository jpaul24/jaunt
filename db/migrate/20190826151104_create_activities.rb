class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :tod
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
