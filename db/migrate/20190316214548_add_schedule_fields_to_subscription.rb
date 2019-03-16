class AddScheduleFieldsToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_reference :subscriptions, :day, foreign_key: true
    add_reference :subscriptions, :start_at, references: :hour
    add_reference :subscriptions, :end_at, references: :hour
    add_reference :subscriptions, :classroom, foreign_key: true
  end
end
