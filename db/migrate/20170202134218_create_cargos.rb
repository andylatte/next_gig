class CreateCargos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargos do |t|

      t.string :time_drop_off
      t.string :contact_drop_off
      t.string :licence_plate_drop_off
      t.string :amount_drop_off
      t.text :comment_drop_off      
      t.string :time_pick_up
      t.string :contact_pick_up
      t.string :licence_plate_pick_up
      t.string :amount_pick_up
      
      t.text :comment_pick_up
      
      t.references :tour_day
      t.timestamps
    end
  end
end
