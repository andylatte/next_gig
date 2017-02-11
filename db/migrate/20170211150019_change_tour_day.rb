class ChangeTourDay < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_days, :type_of_day, :string
  end
end
