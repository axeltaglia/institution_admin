class CreateContactInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_informations do |t|
      t.references :student, foreign_key: true
      t.string :email
      t.string :phone
      t.string :description
      t.boolean :receives_emails

      t.timestamps
    end
  end
end
