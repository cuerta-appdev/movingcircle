require 'rails_helper'

RSpec.describe Building, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:building_bookmarks) }

    it { should have_many(:apartments) }

    it { should have_many(:building_amenities) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
