class ApartmentComment < ApplicationRecord
  # Direct associations

  belongs_to :apartment

  belongs_to :user

  # Indirect associations

  # Validations

end
