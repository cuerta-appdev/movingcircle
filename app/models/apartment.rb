class Apartment < ApplicationRecord
  mount_uploader :floor_plan, FloorPlanUploader

  # Direct associations

  belongs_to :building

  has_many   :furniture_packs,
             :dependent => :destroy

  has_many   :apartment_comments,
             :dependent => :destroy

  has_many   :apartment_bookmarks,
             :dependent => :destroy

  has_many   :apartment_photos,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
