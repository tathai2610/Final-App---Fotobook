class Admin::AlbumsController < ApplicationController
  before_action :admin?

  def index
    @albums = Album.order(created_at: :desc).page(params[:page]).per(40)
  end

  def edit
    @album = Album.find(get_album)
    @photos = @album.photos
  end

  def update
    @album = Album.find(get_album)
    @photo = @album.photos.new(photo_detail)
    unless @photo.image_url.nil?
      @photo.user_id = @album.user_id
      @photo.save
    end
    if @album.update_attributes(album_detail)
      flash[:success] = "An album has been successfully updated."
      redirect_to admin_albums_path
    else
      flash[:danger] = @album.errors.full_messages[0]
      redirect_to edit_album_path(@album.id)
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

  protected
  def admin?
    if !current_user.admin
      redirect_to authenticated_root_path
    end
  end

  private
  def get_album
    params.require(:id)
  end

  def album_detail
    params.require(:album).permit(:title, :description, :shared)
  end

  def photo_detail
    params.require(:album).permit(:title, :description, :shared, :image)
  end

end
