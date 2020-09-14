class PhotosController < ApplicationController
 def new
   @photo = Photo.new
 end

 def create
   @photo = Photo.new(photo_detail)
   @photo.user_id = current_user.id

   if @photo.save
     flash[:success] = "New photo has been successfully added."
     redirect_to user_path(current_user.id)
   else
     flash[:danger] = @photo.errors.full_messages[0]
     redirect_to action: :new
   end
 end

 def edit
   @photo = Photo.find(params[:id])
 end

 def update
   @photo = Photo.find(params[:id])

   if update_attributes(photo_detail)
     flash[:success] = "New photo has been successfully added."
     redirect_to user_path(@photo.user_id)
   else
     flash[:danger] = @photo.errors.full_messages[0]
     redirect_to edit_photo_path(@photo.id)
   end
 end

 def destroy
   @photo = Photo.find(params[:id])
   user_id = @photo.user_id

     if @photo.destroy
       flash[:success] = "Successfully deleted photo!"
       redirect_to user_path(user_id)
     else
       flash[:danger] = @photo.errors.full_messages[0]
       redirect_to edit_photo_path(@photo.id)
     end
   end

 private

   def photo_detail
     params.require(:photo).permit(:title, :description, :image, :shared, :album_id)
   end
end
