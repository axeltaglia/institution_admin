class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.references :institution_owner, foreign_key: true

      t.timestamps
    end
  end
end
