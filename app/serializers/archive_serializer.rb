class ArchiveSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :token, :path

  def path
    rails_blob_url(object.image) if object.image.attached?
  end

end
