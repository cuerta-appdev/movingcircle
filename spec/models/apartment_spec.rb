require 'rails_helper'

RSpec.describe Apartment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:building) }

    it { should have_many(:apartment_bookmarks) }

    it { should have_many(:apartment_photos) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
