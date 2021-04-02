require 'rails_helper'

describe "delete a dog route", :type => :request do

  before do
    @dog = FactoryBot.create(:dog)
    @dog2 = FactoryBot.create(:dog)
  end

  it 'deletes dog' do
    delete "/dogs/#{@dog.id}"
    expect(JSON.parse(response.body)['message']).to eq("This dog has been deleted successfully.")
  end

  it 'deletes a dog' do
    delete "/dogs/#{@dog.id}"
    get "/dogs"
    expect(JSON.parse(response.body)).to eq([YAML.load(@dog2.to_json)])
  end
end