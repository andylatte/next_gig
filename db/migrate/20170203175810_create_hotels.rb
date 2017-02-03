class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string   :hotel_name
      t.string   :address_1
      t.string   :address_2
      t.string   :zip_code
      t.string   :city
      t.string         :country
      t.date           :check_in_date 
      t.date           :check_out_date
      t.integer        :number_of_nights
      t.string         :single_rooms
      t.string         :twin_rooms
      t.string         :breakfast
      t.text           :comment
      
      t.string         :type
      
      t.references     :tour_day
      t.timestamps
    end
  end
end

