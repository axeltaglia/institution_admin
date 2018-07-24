class AddFieldsToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :name, :string
    add_column :students, :last_name, :string
    add_column :students, :phone, :string
    add_column :students, :email, :string
    add_column :students, :description, :text
  end
end
