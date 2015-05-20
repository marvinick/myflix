class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def index
    @videos = Video.all
  end

  def show; end

  def new
    @video = Video.new
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end

  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to root_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :small_cover_url, :large_cover_url, category_ids: [])
  end

  def set_video
    @video = Video.find(params[:id])
  end
end