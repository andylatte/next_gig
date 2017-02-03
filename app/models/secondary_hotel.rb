# == Schema Information
#
# Table name: hotels
#
#  id               :integer          not null, primary key
#  hotel_name       :string
#  address_1        :string
#  address_2        :string
#  zip_code         :string
#  city             :string
#  country          :string
#  check_in_date    :date
#  check_out_date   :date
#  number_of_nights :integer
#  single_rooms     :string
#  twin_rooms       :string
#  breakfast        :string
#  comment          :text
#  type             :string
#  tour_day_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_hotels_on_tour_day_id  (tour_day_id)
#

class SecondaryHotel < Hotel
  
  # scopes

   # associations

   # validations

   # callbacks

   # public instance methods
end
