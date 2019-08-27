class AddDurationToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :duration, :integer
  end
end
