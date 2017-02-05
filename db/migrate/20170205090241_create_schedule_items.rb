class CreateScheduleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_items do |t|
      t.string :name
      t.string :for_whom
      t.string :number
      t.string :origin
      t.string :destination
      t.time :call_time
      
      t.date_time :departion_date_time (zusammen?)
      t.date_time :arrival_date_time
      
      t.string :duration
      t.string :contact (sollte das mit addresse, email, phone, name sein?)
      t.string :location
      t.string :comment
      t.references :tour_day
      t.timestamps
    end
  end
end



what	who	no.	from	to	call time	dep day	dep time	arr day	arr time	hours/km	comment


what	who	from	to	notes


what	who	where	from	to	contact	comments


speichern, wenn welches Formfeld beschrieben?