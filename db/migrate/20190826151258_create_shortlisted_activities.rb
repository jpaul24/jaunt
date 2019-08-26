class CreateShortlistedActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :shortlisted_activities do |t|
      t.references :activity, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
