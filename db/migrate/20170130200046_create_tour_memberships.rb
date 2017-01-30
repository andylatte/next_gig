class CreateTourMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_memberships do |t|
      t.references :user
      t.references :tour
      t.timestamps
    end
  end
end
