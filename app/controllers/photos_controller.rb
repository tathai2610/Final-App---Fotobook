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
    @photo = current_user.photos.find(params[:id])
  end

  def update
    @photo = current_user.photos.find(params[:id])

    if @photo.update_attributes(photo_detail)
      flash[:success] = "A photo has been successfully updated."
      redirect_to user_path(@photo.user_id)
    else
      flash[:danger] = @photo.errors.full_messages[0]
      redirect_to edit_photo_path(@photo.id)
    end
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    user_id = @photo.user_id
    album_id = @photo.album_id

    if @photo.destroy
      flash[:success] = "Successfully deleted photo!"
      if album_id
        redirect_to edit_album_path(album_id)
      else
        redirect_to user_path(user_id)
      end
    else
      flash[:danger] = @photo.errors.full_messages[0]
      if album_id
        redirect_to edit_album_path(album_id)
      else
        redirect_to edit_admin_photo_path(@photo.id)
      end
    end
  end

  private

  def photo_detail
    params.require(:photo).permit(:title, :description, :image, :shared, :album_id)
  end
end
