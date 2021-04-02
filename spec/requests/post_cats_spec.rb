require 'rails_helper'

describe "post a cat route", :type => :request do

  before do
    post '/cats', params: { :name => 'fluffy', :gender => 'test_gender', :breed => 'test_breed', :size => 'test_size' }
  end

  it 'returns the cat name' do
    expect(JSON.parse(response.body)['name']).to eq('fluffy')
  end

  it 'returns the cat gender' do
    expect(JSON.parse(response.body)['gender']).to eq('test_gender')
  end

  it 'returns the cat breed' do
    expect(JSON.parse(response.body)['breed']).to eq('test_breed')
  end

  it 'returns the cat size' do
    expect(JSON.parse(response.body)['size']).to eq('test_size')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end