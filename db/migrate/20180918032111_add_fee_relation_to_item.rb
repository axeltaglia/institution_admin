class AddFeeRelationToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :fee, foreign_key: true
  end
end
