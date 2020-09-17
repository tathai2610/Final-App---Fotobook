class Admin::PhotosController < ApplicationController
  before_action :admin?

  def index
    @photos = Photo.all_photo.page(params[:page]).per(40)
  end

  def edit
    @photo = Photo.find(get_photo)
  end

  def update
    @photo = Photo.find(get_photo)
    if @photo.update_attributes(photo_detail)
      flash[:success] = "A photo has been successfully updated."
      redirect_to admin_photos_path
    else
      flash[:danger] = @photo.errors.full_messages[0]
      redirect_to edit_admin_photo_path(@photo.id)
    end
  end

  def destroy
    Photo.find(get_photo).destroy
    redirect_to admin_photos_path
  end

  protected
  def admin?
    if !current_user.admin
      redirect_to authenticated_root_path
    end
  end

  private
  def get_photo
    params.require(:id)
  end

  def photo_detail
    params.require(:photo).permit(:title, :description, :image, :shared, :album_id)
  end
end
