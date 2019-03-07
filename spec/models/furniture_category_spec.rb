require 'rails_helper'

RSpec.describe FurnitureCategory, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:furniture_pack) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
