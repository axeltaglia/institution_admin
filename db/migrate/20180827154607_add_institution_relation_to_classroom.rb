class AddInstitutionRelationToClassroom < ActiveRecord::Migration[5.0]
  def change
    add_reference :classrooms, :institution, foreign_key: true
  end
end
