class ArchiveSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :token, :url

  def url
    url_for(object.image) if object.image.attached?
  end

end

class ArchiveShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :token, :user_name, :url

  def url
    url_for(object.image) if object.image.attached?
  end
end