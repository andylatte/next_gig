class CreateCrewMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :crew_memberships do |t|
      
      t.integer :tour_manager_id
      t.integer :crew_member_id
      
      t.timestamps
      
      t.index :tour_manager_id
    end
  end
end
