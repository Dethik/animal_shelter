require 'rails_helper'

describe Dog do
  it { should validate_presence_of :name }
  it { should validate_presence_of :gender }
  it { should validate_presence_of :breed }
  it { should validate_presence_of :size }
end