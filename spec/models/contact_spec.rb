# == Schema Information
#
# Table name: contacts
#
#  id                  :integer          not null, primary key
#  main_contact_name   :string
#  main_contact_phone  :string
#  main_contact_email  :string
#  prod_contact_name   :string
#  prod_contact_phone  :string
#  prod_contact_email  :string
#  hosp_contact_name   :string
#  hosp_contact_phone  :string
#  hosp_contact_email  :string
#  stage_manager_name  :string
#  stage_manager_phone :string
#  stage_manager_email :string
#  tour_day_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_contacts_on_tour_day_id  (tour_day_id)
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
