class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.date :start_date
      t.integer :status

      t.timestamps
    end
  end
end
