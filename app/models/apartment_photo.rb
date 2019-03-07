class ApartmentPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :apartment

  # Indirect associations

  # Validations

end
