require 'rails_helper'

RSpec.describe FurniturePack, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:pack_comments) }

    it { should have_many(:furniture_categories) }

    it { should have_many(:pack_bookmarks) }

    it { should have_many(:furtniture_objects) }

    it { should belong_to(:apartment) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
