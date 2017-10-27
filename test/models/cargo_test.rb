# == Schema Information
#
# Table name: cargos
#
#  id                     :integer          not null, primary key
#  time_drop_off          :string
#  contact_drop_off       :string
#  licence_plate_drop_off :string
#  amount_drop_off        :string
#  comment_drop_off       :text
#  time_pick_up           :string
#  contact_pick_up        :string
#  licence_plate_pick_up  :string
#  amount_pick_up         :string
#  comment_pick_up        :text
#  tour_day_id            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_cargos_on_tour_day_id  (tour_day_id)
#

require 'test_helper'

class CargoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
