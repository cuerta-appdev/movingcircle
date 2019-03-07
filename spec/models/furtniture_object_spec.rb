require 'rails_helper'

RSpec.describe FurtnitureObject, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:furniture_pictures) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
