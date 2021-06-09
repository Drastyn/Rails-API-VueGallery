class ArchiveController < ApplicationController

  before_action :set_archive, only: [:show]

  def index
    @archives = Archive.archive_data.page(params[:page]).per(8).without_count
    .includes(image_attachment: :blob)
    render json: { 
      data: ActiveModel::Serializer::CollectionSerializer.new(@archives, each_serializer: ArchiveSerializer),
      next_page_url: @archives.next_page,
      prev_page_url: @archives.prev_page
    }
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

  private

  def set_archive
    @archive = Archive.archive_data.uploaded_by.find_by(token: params[:token])
  end

  def archive_params_new
    params.require(:archive).permit(:name, :image)
    .with_defaults(token: Digest::MD5.hexdigest(Time.now.to_s + params[:archive][:name]))
  end

end
