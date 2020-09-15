class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_detail)
    @album.user_id = current_user.id
    @photo = @album.photos.new(photo_detail)
    @photo.user_id = @album.user_id
    if @album.save && @photo.save
      flash[:success] = "New album has been successfully added."
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = @photo.errors.full_messages[0]
      redirect_to action: :new
    end
  end

   def edit
     @album = current_user.albums.find(params[:id])
     @photos = @album.photos
   end

   def update
     @album = current_user.albums.find(params[:id])
     @photo = @album.photos.new(photo_detail)
     unless @photo.image_url.nil?
       @photo.user_id = @album.user_id
       @photo.save
     end
     if @album.update_attributes(album_detail)
       flash[:success] = "An album has been successfully updated."
       redirect_to user_path(@album.user_id)
     else
       flash[:danger] = @album.errors.full_messages[0]
       redirect_to edit_photo_path(@album.id)
     end
   end

   def destroy
     @album = current_user.albums.find(params[:id])
     user_id = @album.user_id

       if @album.destroy
         flash[:success] = "Successfully deleted photo!"
         redirect_to user_path(user_id)
       else
         flash[:danger] = @album.errors.full_messages[0]
         redirect_to edit_photo_path(@album.id)
       end
   end

  private

    def album_detail
      params.require(:album).permit(:title, :description, :shared)
    end

    def photo_detail
      params.require(:album).permit(:title, :description, :shared, :image)
    end
end
