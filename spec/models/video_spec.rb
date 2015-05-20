require 'spec_helper'

describe Video do
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should have_many(:video_categories)}
  it { should have_many(:categories)}

  describe "search_by_title" do
    it "returns an empty array if there's no match" do
      video1 = Video.create(title: "futurama", description: "space travel")
      video2 = Video.create(title: "family guy", description: "funny")
      expect(Video.search_by_title("hello")).to eq([])
    end

    it "returns an array of a video if there's full match" do
      video1 = Video.create(title: "futurama", description: "space travel")
      video2 = Video.create(title: "family guy", description: "funny")
      expect(Video.search_by_title("futurama")).to eq([video1])
    end
    it "returns an array of a video if there's a partial match " do
      video1 = Video.create(title: "futurama", description: "space travel")
      video2 = Video.create(title: "family guy", description: "funny")
      expect(Video.search_by_title("futu")).to eq([video1])
    end
    it "returns an array of all matches ordered by title " do
      video1 = Video.create(title: "futurama", description: "space travel", created_at: 1.day.ago)
      video2 = Video.create(title: "family guy", description: "funny")
      expect(Video.search_by_title("fam")).to eq([video2, video1])
    end
    it "returns an empty array when nothing in search bar " do
      video1 = Video.create(title: "futurama", description: "space travel", created_at: 1.day.ago)
      video2 = Video.create(title: "family guy", description: "funny")
      expect(Video.search_by_title("")).to eq([])
    end
  end
end