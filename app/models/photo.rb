class Photo < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :albums

  has_many :likes, as: :likeable

  validates :title, presence: true, length: {maximum: 140, message: "Title is maximum 140 characters"}
  validates :description, presence: true, length: {maximum: 300, message: "Description is maximum 300 characters"}
  validates :shared, inclusion: { in: [true, false]}

  before_validation :check_description

  mount_uploader :image, ImageUploader

  scope :feed_photo, -> (current_user) { where(user_id:current_user.followees, shared:true).or(Photo.where(user_id:current_user)).order(created_at: :desc) }
  scope :discover_photo, -> { where(shared:true).order(created_at: :desc) }

  private
    def check_description
      unless description.present?
        self.description = "This photo of user who has id #{user_id}"
      end
    end


end
