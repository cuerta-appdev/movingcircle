class Apartment < ApplicationRecord
  # Direct associations

  belongs_to :building

  has_many   :apartment_bookmarks,
             :dependent => :destroy

  has_many   :apartment_photos,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
