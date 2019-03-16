class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :subscription, foreign_key: true
      t.references :day, foreign_key: true
      t.references :start_at, references: :hour
      t.references :end_at, references: :hour
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
