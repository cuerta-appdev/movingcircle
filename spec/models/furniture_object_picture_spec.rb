require 'rails_helper'

RSpec.describe FurnitureObjectPicture, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:furniture_object) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
