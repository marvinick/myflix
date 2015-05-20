require 'spec_helper'

describe Video do
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should have_many(:video_categories)}
  it { should have_many(:categories)}
end