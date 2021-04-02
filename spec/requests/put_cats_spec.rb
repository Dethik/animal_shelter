require 'rails_helper'

describe "update a cat route", :type => :request do

  before do
    @cat = FactoryBot.create(:cat)
    put "/cats/#{@cat.id}", params: { :name => 'updated_name', :gender => 'updated_gender', :breed => 'updated_breed', :size => 'updated_size'}
  end

  it 'updates the cat name' do
    expect(Cat.find(@cat.id).name).to eq('updated_name')
  end

  it 'updates the cat gender' do
    expect(Cat.find(@cat.id).gender).to eq('updated_gender')
  end

  it 'updates the cat breed' do
    expect(Cat.find(@cat.id).breed).to eq('updated_breed')
  end

  it 'updates the cat size' do
    expect(Cat.find(@cat.id).size).to eq('updated_size')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This cat has been updated successfully.")
  end
end