require 'rails_helper'

describe "delete a cat route", :type => :request do

  before do
    @cat = FactoryBot.create(:cat)
    @cat2 = FactoryBot.create(:cat)
  end
end