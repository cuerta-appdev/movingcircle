class User < ApplicationRecord
  # Direct associations

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
