class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :asignature_name
      t.integer :subscription_price
      t.string :day
      t.string :start_at
      t.string :end_at
      t.string :classroom
      t.references :fee, foreign_key: true

      t.timestamps
    end
  end
end
