class AddInstitutionReferencesToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedules, :institution, foreign_key: true
  end
end
