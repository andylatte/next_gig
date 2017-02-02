# == Schema Information
#
# Table name: productions
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
#  stage_size          :string
#  local_backline      :string
#  access_notes        :text
#  loading_notes       :text
#  credential_notes    :text
#  comment             :text
#  tour_day_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_productions_on_tour_day_id  (tour_day_id)
#

class Production < ApplicationRecord
  # scopes

   # associations
   belongs_to :tour_day

   # validations

   # callbacks

   # public instance methods
end
