class User < ApplicationRecord
  # Direct associations

  has_many   :building_bookmarks,
             :dependent => :destroy

  has_many   :apartment_bookmarks,
             :dependent => :destroy

  has_many   :pack_bookmarks,
             :dependent => :destroy

  has_many   :apartments,
             :dependent => :destroy

  has_many   :furniture_packs,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
