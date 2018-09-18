class AddFeeReferencesToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :item, foreign_key: true
  end
end
