require 'rails_helper'

describe "update a dog route", :type => :request do

  before do
    @dog = FactoryBot.create(:dog)
    put "/dogs/#{@dog.id}", params: { :name => 'updated_name', :gender => 'updated_gender', :breed => 'updated_breed', :size => 'updated_size'}
  end

  it 'updates the dog name' do
    expect(Dog.find(@dog.id).name).to eq('updated_name')
  end

  it 'updates the dog gender' do
    expect(Dog.find(@dog.id).gender).to eq('updated_gender')
  end

  it 'updates the dog breed' do
    expect(Dog.find(@dog.id).breed).to eq('updated_breed')
  end

  it 'updates the dog size' do
    expect(Dog.find(@dog.id).size).to eq('updated_size')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This dog has been updated successfully.")
  end
end