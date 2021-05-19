class ArchiveSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :token, :users_id, :url

  def url
    url_for(object.image) if object.image.attached?
  end

end
