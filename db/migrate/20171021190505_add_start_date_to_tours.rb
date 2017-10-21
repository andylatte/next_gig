class AddStartDateToTours < ActiveRecord::Migration[5.0]
  def up
    add_column :tours, :start_date, :date
    Tour.all.each do |t|
      t.update_start_date
      t.update(start_date: Date.today) if t.tour_days_count.blank?
    end 
    change_column_null :tours, :start_date, false
  end
  def down
    remove_column :tours, :start_date, :date
  end
end
