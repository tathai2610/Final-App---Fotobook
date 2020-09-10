class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:guest_feed_photo, :guest_feed_album]

  def feed_photo
    @photos = Photo.feed_photo current_user
  end
  def feed_album
    @albums = Album.feed_album current_user
  end

  def discover_photo
    @photos = Photo.discover_photo
  end
  def discover_album
    @albums = Album.discover_album
  end

  def guest_feed_photo
    @photos = Photo.discover_photo
  end
  def guest_feed_album
    @albums = Album.discover_album
  end

end
