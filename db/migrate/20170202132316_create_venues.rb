class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string    :venue_name
      t.string    :address_1
      t.string    :address_2
      t.string    :zip_code
      t.string    :city
      t.string    :country
      t.string    :url
      t.string    :event_type
      t.string    :slot
      t.string    :stage
      t.string    :capacity
      t.string    :sales
      t.text    :comment

      t.references :tour_day
      t.timestamps
    end
  end
end
