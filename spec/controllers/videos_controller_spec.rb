require "spec_helper"

describe VideosController do
  describe "GET index" do
    it "shows @videos" do
      video = Video.create!(title: "Ironman", description: "great movie")
      get :index
      expect(assigns(:videos)).to eq([video])
    end
  end
end
