# == Schema Information
#
# Table name: tours
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tour_name       :string
#  band_name       :string
#  tour_days_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  start_date      :date             not null
#
# Indexes
#
#  index_tours_on_user_id  (user_id)
#

require 'test_helper'

class TourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
