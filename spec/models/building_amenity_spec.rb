require 'rails_helper'

RSpec.describe BuildingAmenity, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:amenity_pictures) }

    it { should belong_to(:building) }

    it { should belong_to(:amenity) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
