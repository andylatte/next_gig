# == Schema Information
#
# Table name: cargos
#
#  id                     :integer          not null, primary key
#  time_drop_off          :string
#  contact_drop_off       :string
#  licence_plate_drop_off :string
#  amount_drop_off        :string
#  time_pick_up           :string
#  contact_pick_up        :string
#  licence_plate_pick_up  :string
#  amount_pick_up         :string
#  comment                :text
#  tour_day_id            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_cargos_on_tour_day_id  (tour_day_id)
#

class Cargo < ApplicationRecord
  # scopes

   # associations
   belongs_to :tour_day

   # validations

   # callbacks

   # public instance methods
end
