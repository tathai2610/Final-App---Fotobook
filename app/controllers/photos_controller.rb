class PhotosController < ApplicationController
  def new
   @photo = Photo.new
 end

 def create
   @photo = Photo.new(photo_detail)

   @photo.user_id = current_user.id
   if @photo.save
     flash[:success] = "New photo has been successfully added."
     redirect_to action: :new
   else
     flash[:danger] = @photo.errors.full_messages[0]
     redirect_to action: :new
   end
 end

 def update

 end

 private

   def photo_detail
     params.require(:photo).permit(:title, :description, :image, :shared)
   end
end
