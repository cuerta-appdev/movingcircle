require 'rails_helper'

RSpec.describe ApartmentBookmark, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:apartment) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
