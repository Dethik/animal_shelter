require 'rails_helper'

describe "get all dogs route", :type => :request do
  let!(:dogs) { FactoryBot.create_list(:dog, 20)}

  before { get '/dogs'}

  it 'returns all dogs' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end