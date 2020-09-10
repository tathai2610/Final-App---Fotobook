class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_commit :send_welcome_email

  def send_welcome_email
    MailerJob.perform_now self
  end

  mount_uploader :avatar, ImageUploader

  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable, :confirmable

    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy

    has_many :likes

    has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
    has_many :followers, through: :follower_follows, source: :follower

    has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followees, through: :followee_follows, source: :followee

    validates :firstname, presence: true, length: {maximum: 25}
    validates :firstname, format: { with: /\A[a-zA-Z]+\z/, message: "should contain only letters"}

    validates :lastname, presence: true, length: {maximum: 25}
    validates :lastname, format: { with: /\A[a-zA-Z]+\z/, message: "should contain only letters"}

    validates :email, uniqueness: true, presence: true, email: true, length: {maximum: 255}

    scope :follow?, ->(user, post) { user.followees.find_by(id: post.user_id) }
end
