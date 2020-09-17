class Album < ApplicationRecord
   belongs_to :user
   has_many :photos, dependent: :destroy

   has_many :likes, as: :likeable

   validates :title, presence: true, length: {maximum: 140}
   validates :description, presence: true, length: {maximum: 300}
   validates :shared, inclusion: { in: [true, false]}

   before_validation :check_description

   scope :feed_album, -> (current_user) { where(user_id:current_user.followees, shared:true).or(Album.where(user_id:current_user)).order(created_at: :desc) }
   scope :discover_album, -> { where(shared:true).order(created_at: :desc) }
   scope :user_album, -> {where(shared:true).order(created_at: :desc)}

   private
     def check_description
       unless description.present?
         self.description = "This album of user who has id #{user_id}"
       end
     end

end
