class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :number
      t.references :institution, foreign_key: true
      t.timestamps
    end
  end
end
