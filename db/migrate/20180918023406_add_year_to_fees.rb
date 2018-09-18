class AddYearToFees < ActiveRecord::Migration[5.0]
  def change
    add_column :fees, :year, :integer
  end
end
