class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.string :main_contact_name
      t.string :main_contact_phone
      t.string :main_contact_email

      t.string :prod_contact_name
      t.string :prod_contact_phone
      t.string :prod_contact_email
      
      t.string :hosp_contact_name
      t.string :hosp_contact_phone
      t.string :hosp_contact_email
      
      t.string :stage_manager_name
      t.string :stage_manager_phone
  ?    t.string :stage_manager_email ?
      
      t.string :stage_size
      t.text   :local_backline
      t.text   :access_notes
      t.text   :loading_notes
      t.text   :credential_notes
      t.text   :comment
      
      t.references :tour_day
      t.timestamps
    end
  end
end

MAIN CONTACT NAME
MAIN CONTACT PHONE
MAIN CONTACT EMAIL
PROD CONTACT NAME
PROD CONTACT PHONE
PROD CONTACT EMAIL
HOSP CONTACT NAME
HOSP CONTACT PHONE
HOSP CONTACT EMAIL
STAGEMANAGER NAME
STAGEMANAGER PHONE
STAGE SIZE
LOCAL BACKLINE
ACCESS NOTES
LOADING NOTES
CREDENTIAL NOTES
SPECIALS/PROBLEMS
