class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @photo = Album.new(album_detail)

    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = "New album has been successfully added."
      redirect_to action: :new
    else
      flash[:danger] = @photo.errors.full_messages[0]
      redirect_to action: :new
    end
  end

  private

    def album_detail
      params.require(:album).permit(:title, :description, :image, :shared)
    end
end
