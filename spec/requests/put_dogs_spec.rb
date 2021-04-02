require 'rails_helper'

describe "delete a dog route", :type => :request do

  before do
    @dog = FactoryBot.create(:dog)
    @dog2 = FactoryBot.create(:dog)
  end
end