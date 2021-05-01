class ArchiveController < ApplicationController

  before_action :set_archive, only: [:show]

  def index
    @archives = Archive.archive_data.page(params[:page]).per(10).without_count
    .includes(image_attachment: :blob)
    render json: @archives
  end

  # GET /archives/:token
  def show
    render json: @archive
  end

  def create
    @archive = Archive.new(archive_params_new)
    
    if @archive.save
      render json: @archive, status: :created
    else
      render json: @archive.errors, status: :unprocessable_entity
    end
  end

  private

  def set_archive
    @archive = Archive.archive_data.find_by(token: params[:token])
  end

  def archive_params_new
    params.require(:archive).permit(:name, :image)
    .with_defaults(token: Digest::MD5.hexdigest(params[:archive][:name]))
  end

end
