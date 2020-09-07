class Photo < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :albums

  has_many :likes, as: :likeable

  validates :title, presence: true, length: {maximum: 140, message: "Title is maximum 140 characters"}
  validates :description, presence: true, length: {maximum: 300, message: "Description is maximum 300 characters"}
  validates :shared, inclusion: { in: [true, false]}

  before_validation :check_description

  mount_uploader :image, ImageUploader

  private
    def check_description
      unless description.present?
        self.description = "This photo of user who has id #{user_id}"
      end
    end
end
