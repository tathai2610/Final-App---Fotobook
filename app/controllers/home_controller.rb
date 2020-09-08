class HomeController < ApplicationController

  def feed_photo
    #Photo.where(user_id:current_user.followees, shared:true).order(created_at: :desc)
    @photos = Photo.where(shared:true).order(created_at: :desc)
  end

  def feed_album
    #Photo.where(user_id:current_user.followees, shared:true).order(created_at: :desc)
    @albums = Album.where(shared:true).order(created_at: :desc)
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
