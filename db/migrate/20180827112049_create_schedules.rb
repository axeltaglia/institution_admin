class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :day, foreign_key: true
      t.references :hour, foreign_key: true

      t.timestamps
    end
  end
end
