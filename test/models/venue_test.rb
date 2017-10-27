# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  venue_name  :string
#  address_1   :string
#  address_2   :string
#  zip_code    :string
#  city        :string
#  country     :string
#  url         :string
#  venue_type  :string
#  slot        :string
#  stage       :string
#  capacity    :string
#  sales       :string
#  comment     :text
#  tour_day_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_venues_on_tour_day_id  (tour_day_id)
#

require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
