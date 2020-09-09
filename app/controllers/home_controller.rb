class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:guest_feed_photo, :guest_feed_album]

  def feed_photo
    @photos = Photo.where(user_id:current_user.followees, shared:true).or(Photo.where(user_id:current_user)).order(created_at: :desc)
  end
  def feed_album
    @albums = Album.where(user_id:current_user.followees, shared:true).or(Album.where(user_id:current_user)).order(created_at: :desc)
  end

  def discover_photo
    @photos = Photo.where(shared:true).order(created_at: :desc)
  end
  def discover_album
    @albums = Album.where(shared:true).order(created_at: :desc)
  end

  def guest_feed_photo
    @photos = Photo.where(shared:true).order(created_at: :desc)
  end
  def guest_feed_album
    @albums = Album.where(shared:true).order(created_at: :desc)
  end

end
