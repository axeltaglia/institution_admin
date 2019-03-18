class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.references :student, foreign_key: true
      t.integer :year
      t.integer :month
      t.integer :total_to_pay
      t.integer :amount_paid
      t.integer :status

      t.timestamps
    end
  end
end
