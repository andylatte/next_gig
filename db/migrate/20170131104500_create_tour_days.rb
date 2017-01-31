class CreateTourDays < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_days do |t|
      t.date      :date
      t.string    :show_name
      t.integer   :km_next_day
      t.text      :comment_next_day
      t.string    :city
      t.string    :country
      t.string    :time_zone
      
      t.references :tour
      t.timestamps
    end
  end
end
