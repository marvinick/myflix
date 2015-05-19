class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def index
    @videos = Video.all
  end

  def show; end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :small_cover_url, :large_cover_url, :category_id)
  def set_video
    @video = Video.find(params[:id])
  end
end