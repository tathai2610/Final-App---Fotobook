class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:guest_feed_photo, :guest_feed_album]

  def feed_photo
    @photos = FeedPhoto.new(current_user).call.page(params[:page]).per(8)
  end
  def feed_album
    @albums = Album.feed_album(current_user).page(params[:page]).per(8)
  end

  def discover_photo
    @photos = Photo.discover_photo.page(params[:page]).per(8)
  end
  def discover_album
    @albums = Album.discover_album.page(params[:page]).per(8)
  end

  def guest_feed_photo
    @photos = Photo.discover_photo.page(params[:page]).per(8)
  end
  def guest_feed_album
    @albums = Album.discover_album.page(params[:page]).per(8)
  end

end
