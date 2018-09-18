class RemoveItemReferencesToItem < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :items, :item, index: true
  end
end
