class RenameVenueEventTypeToVenueType < ActiveRecord::Migration[5.0]
  def change
    rename_column :venues, :event_type, :venue_type
  end
end
