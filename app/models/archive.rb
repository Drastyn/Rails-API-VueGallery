class Archive < ApplicationRecord
    has_one_attached :image

    belongs_to :user, foreign_key: "users_id"

    before_save { self.name = name.strip }
    before_save { self.name = name.downcase }

    validates :name, presence: true, format: { :with => /\A+[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ\s]+\z/, message: " Solo se permiten letras" }
    validates :image, presence: true
    validates_length_of :name, minimum: 4, maximum: 40
    validates :image, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }
    private

    # Query functions

    def self.archive_data
        self.select(:id, :name, :token)
    end

    def self.uploaded_by
        self.select('users.name as user_name').joins(:user)
    end
end
