class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :asignature, foreign_key: true
      t.references :schedule, foreign_key: true
      t.references :classroom, foreign_key: true
      t.integer :capacity
      t.float :duration
      t.integer :frecuency
      t.integer :price
      t.integer :charging_mode

      t.timestamps
    end
  end
end
