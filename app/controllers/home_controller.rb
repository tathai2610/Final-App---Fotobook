class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:guest_feed]

  def feed
    @photos = Photo.where(user_id:current_user.followees, shared:true).order(created_at: :desc)
    @albums = Album.where(user_id:current_user.followees, shared:true).order(created_at: :desc)
  end

  def discover_photo
    @photos = Photo.where(shared:true).order(created_at: :desc)
  end

  def discover_album
    @albums = Album.where(shared:true).order(created_at: :desc)
  end

  def guest_feed
    @photos = Photo.where(shared:true).order(created_at: :desc)
    @albums = Album.where(shared:true).order(created_at: :desc)
  end

end
