class Album < ApplicationRecord
   belongs_to :user
   has_and_belongs_to_many :photos

   has_many :likes, as: :likeable

   validates :title, presence: true, length: {maximum: 140, minimum: 10}
   validates :description, presence: true, length: {maximum: 300}
   validates :shared, inclusion: { in: [true, false]}

   before_validation :check_description

   private
     def check_description
       unless description.present?
         self.description = "This album of user who has id #{user_id}"
       end
     end

end
