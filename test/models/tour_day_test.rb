# == Schema Information
#
# Table name: tour_days
#
#  id               :integer          not null, primary key
#  date             :date
#  show_name        :string
#  km_next_day      :string
#  comment_next_day :text
#  city             :string
#  country          :string
#  time_zone        :string
#  tour_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  type_of_day      :string
#
# Indexes
#
#  index_tour_days_on_tour_id  (tour_id)
#

require 'test_helper'

class TourDayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
