class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.string :str_time
      t.string :seconds_since_midnight

      t.timestamps
    end
  end
end
