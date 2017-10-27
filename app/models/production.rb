# == Schema Information
#
# Table name: productions
#
#  id               :integer          not null, primary key
#  stage_size       :string
#  local_backline   :string
#  access_notes     :text
#  loading_notes    :text
#  credential_notes :text
#  comment          :text
#  tour_day_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
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
