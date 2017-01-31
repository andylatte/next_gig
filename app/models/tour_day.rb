class TourDay < ApplicationRecord
  # scopes

   # associations
   belongs_to :tour

   # validations
   validates :date, presence: true

   # callbacks

   # public instance methods
end
