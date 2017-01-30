class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.references :user

      t.string    :tour_name
      t.string    :band_name
      t.date      :first_show_day
      t.date      :last_show_day
      t.integer   :show_day_count

      t.timestamps
    end
  end
end