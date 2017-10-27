class CreateContacts < ActiveRecord::Migration[5.1]
  def up
    create_table :contacts do |t|
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
      t.string :stage_manager_email

      t.references :tour_day
      t.timestamps
    end

    TourDay.all.each do |d|
      production = d.production
      d.contact = Contact.new(main_contact_name:   production.main_contact_name,
                              main_contact_phone:  production.main_contact_phone,
                              main_contact_email:  production.main_contact_email,
                              prod_contact_name:   production.prod_contact_name,
                              prod_contact_phone:  production.prod_contact_phone,
                              prod_contact_email:  production.prod_contact_email,
                              hosp_contact_name:   production.hosp_contact_name,
                              hosp_contact_phone:  production.hosp_contact_phone,
                              hosp_contact_email:  production.hosp_contact_email,
                              stage_manager_name:  production.stage_manager_name,
                              stage_manager_phone: production.stage_manager_phone,
                              stage_manager_email: production.stage_manager_email ) unless production.blank?

    end
    remove_column :productions, :main_contact_name, :string
    remove_column :productions, :main_contact_phone, :string
    remove_column :productions, :main_contact_email, :string

    remove_column :productions, :prod_contact_name, :string
    remove_column :productions, :prod_contact_phone, :string
    remove_column :productions, :prod_contact_email, :string

    remove_column :productions, :hosp_contact_name, :string
    remove_column :productions, :hosp_contact_phone, :string
    remove_column :productions, :hosp_contact_email, :string

    remove_column :productions, :stage_manager_name, :string
    remove_column :productions, :stage_manager_phone, :string
    remove_column :productions, :stage_manager_email, :string
  end

  def down
    add_column :productions, :main_contact_name, :string
    add_column :productions, :main_contact_phone, :string
    add_column :productions, :main_contact_email, :string

    add_column :productions, :prod_contact_name, :string
    add_column :productions, :prod_contact_phone, :string
    add_column :productions, :prod_contact_email, :string

    add_column :productions, :hosp_contact_name, :string
    add_column :productions, :hosp_contact_phone, :string
    add_column :productions, :hosp_contact_email, :string

    add_column :productions, :stage_manager_name, :string
    add_column :productions, :stage_manager_phone, :string
    add_column :productions, :stage_manager_email, :string

    TourDay.all.each do |d|
      contact = d.contact
      d.production.update(main_contact_name:   contact.main_contact_name,
                          main_contact_phone:  contact.main_contact_phone,
                          main_contact_email:  contact.main_contact_email,
                          prod_contact_name:   contact.prod_contact_name,
                          prod_contact_phone:  contact.prod_contact_phone,
                          prod_contact_email:  contact.prod_contact_email,
                          hosp_contact_name:   contact.hosp_contact_name,
                          hosp_contact_phone:  contact.hosp_contact_phone,
                          hosp_contact_email:  contact.hosp_contact_email,
                          stage_manager_name:  contact.stage_manager_name,
                          stage_manager_phone: contact.stage_manager_phone,
                          stage_manager_email: contact.stage_manager_email ) unless contact.blank?

    end
    drop_table :contacts
  end
end
