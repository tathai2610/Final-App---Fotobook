class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_detail)
    @album.user_id = current_user.id
    @photo = @album.photos.new(photo_detail)
    @photo.user_id = current_user.id

    if @album.save && @photo.save
      flash[:success] = "New album has been successfully added."
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = @photo.errors.full_messages[0]
      redirect_to action: :new
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
