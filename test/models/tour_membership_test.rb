# == Schema Information
#
# Table name: tour_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tour_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tour_memberships_on_tour_id  (tour_id)
#  index_tour_memberships_on_user_id  (user_id)
#

require 'test_helper'

class TourMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
