require 'rails_helper'

describe "delete a cat route", :type => :request do

  before do
    @cat = FactoryBot.create(:cat)
    @cat2 = FactoryBot.create(:cat)
  end

  it 'deletes cat' do
    delete "/cats/#{@cat.id}"
    expect(JSON.parse(response.body)['message']).to eq("This cat has been deleted successfully.")
  end

  it 'deletes a cat' do
    delete "/cats/#{@cat.id}"
    get "/cats"
    expect(JSON.parse(response.body)).to eq([YAML.load(@cat2.to_json)])
  end
end