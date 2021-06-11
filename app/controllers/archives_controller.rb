class ArchivesController < ApplicationController

  include ArchivesHelper

  before_action :set_archive, only: [:show]

  def index
    @archives = Archive.archives_data.page(params[:page]).per(8).without_count
    .includes(image_attachment: :blob)
    set_response
  end

  def show
    render json: @archive, serializer: ArchiveShowSerializer
  end

  def create
    @archive = current_user.archives.new(archive_params_new)
    
    if @archive.save
      render json: @archive, status: :created
    else
      render json: @archive.errors, status: :unprocessable_entity
    end
  end

  def search
    @archives = Archive.archives_data.search_archives(params[:search]).page(params[:page]).per(8).without_count
    .includes(image_attachment: :blob)
    set_response
  end

  private

  def set_archive
    @archive = Archive.archives_data.uploaded_by.find_by_token(params[:token])
  end

  def archive_params_new
    params.require(:archive).permit(:name, :image)
    .with_defaults(token: Digest::MD5.hexdigest(Time.now.to_s + params[:archive][:name]))
  end

end
