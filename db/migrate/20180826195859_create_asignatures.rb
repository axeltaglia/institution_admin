class CreateAsignatures < ActiveRecord::Migration[5.0]
  def change
    create_table :asignatures do |t|
      t.string :name
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
