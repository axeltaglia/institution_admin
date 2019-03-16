class RemoveUserRelationToStudent < ActiveRecord::Migration[5.0]
  def change
    remove_reference :students, :user, index:true, foreign_key: true
  end
end
