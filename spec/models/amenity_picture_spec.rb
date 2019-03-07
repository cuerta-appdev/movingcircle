require 'rails_helper'

RSpec.describe AmenityPicture, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:building_amenity) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
