class AddDayToShortlistedActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :shortlisted_activities, :day, :string
  end
end
