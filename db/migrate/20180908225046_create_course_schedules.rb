class CreateCourseSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :course_schedules do |t|
      t.references :course, foreign_key: true
      t.references :day, foreign_key: true
      t.references :start_at, references: :hour
      t.references :end_at, references: :hour
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
