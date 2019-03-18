class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :student, foreign_key: true
      t.references :asignature, foreign_key: true
      t.integer :price
      t.references :day, foreign_key: true
      t.references :start_at, references: :hour
      t.references :end_at, references: :hour
      t.references :classroom, foreign_key: true
      t.integer :status
      
      t.timestamps
    end
  end
end
