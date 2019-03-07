class Building < ApplicationRecord
  # Direct associations

  has_many   :apartments,
             :dependent => :destroy

  has_many   :building_amenities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
