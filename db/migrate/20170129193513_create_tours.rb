class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.references :user

      t.string    :tour_name
      t.string    :band_name
      t.integer   :tour_days_count

      t.timestamps
    end
  end
end
