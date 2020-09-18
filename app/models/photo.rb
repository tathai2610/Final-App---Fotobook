class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :album, optional: true

  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, presence: true, length: {maximum: 140}
  validates :description, presence: true, length: {maximum: 300}
  validates :shared, inclusion: { in: [true, false]}

  before_validation :check_description

  mount_uploader :image, ImageUploader

  scope :discover_photo, -> { where(shared:true, album_id:nil).order(created_at: :desc) }
  scope :all_photo, -> {where(album_id:nil).order(created_at: :desc)}
  scope :current_user_photo, -> {where(album_id:nil).order(created_at: :desc)}
  scope :user_photo, -> {where(shared:true, album_id:nil).order(created_at: :desc)}

  private
    def check_description
      unless description.present?
        self.description = "This photo of user who has id #{user_id}"
      end
    end


end
