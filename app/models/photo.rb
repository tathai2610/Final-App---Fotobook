class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :album, optional: true

  has_many :likes, as: :likeable

  validates :title, presence: true, length: {maximum: 140}
  validates :description, presence: true, length: {maximum: 300}
  validates :shared, inclusion: { in: [true, false]}

  before_validation :check_description

  mount_uploader :image, ImageUploader

  scope :feed_photo, -> (current_user) { where(user_id:current_user.followees, shared:true, album_id:nil).or(Photo.where(user_id:current_user, album_id:nil)).order(created_at: :desc) }
  scope :discover_photo, -> { where(shared:true, album_id:nil).order(created_at: :desc) }

  private
    def check_description
      unless description.present?
        self.description = "This photo of user who has id #{user_id}"
      end
    end


end
