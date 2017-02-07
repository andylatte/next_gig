class CreateScheduleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_items do |t|
      t.string :name
      t.string :for_whom
      t.string :number
      t.string :origin
      t.string :destination
      t.datetime :start_time
      t.datetime :end_time
      
      t.datetime :departure_date_time
      t.datetime :arrival_date_time
      
      t.string :duration
      t.string :contact
      t.string :comment
      
      t.string :type
      t.references :tour_day
      t.timestamps
    end
  end
end