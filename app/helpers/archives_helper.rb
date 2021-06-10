module ArchivesHelper
  private

  def set_response
    render json: { 
      data: ActiveModel::Serializer::CollectionSerializer.new(@archives, each_serializer: ArchiveSerializer),
      next_page_url: @archives.next_page,
      prev_page_url: @archives.prev_page
    }
  end
end