class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
      @user_own_profile = @user == current_user
      if @user_own_profile
        @photos = current_user.photos.current_user_photo.page(params[:page]).per(12)
        @albums = current_user.albums.order(created_at: :desc).page(params[:page]).per(12)
        @followings = current_user.followees.order(:firstname).page(params[:page]).per(8)
        @followers = current_user.followers.order(:firstname).page(params[:page]).per(8)
      else
        @photos = @user.photos.user_photo.page(params[:page]).per(12)
        @albums = @user.albums.user_album.page(params[:page]).per(12)
        @followings = @user.followees.order(:firstname).page(params[:page]).per(8)
        @followers = @user.followers.order(:firstname).page(params[:page]).per(8)
      end
    end

    def follow
      @user = User.find(follow_user)
      follow = Follow.find_by(follower_id:current_user.id, followee_id:@user.id)
      if follow
          follow.destroy
      else
          current_user.followees << @user
      end
      render 'follow.js.erb'
    end

    def like
      like_record = Like.find_by(like_post)
      if like_record
        like_record.destroy
      else
        Like.create(like_post)
      end
      render 'like.js.erb'
    end

    def get_album
      photos = Album.find(params[:content_id]).photos
      html = String.new
      html += '<div class="carousel-item active"><img src="'+ photos.last.image.url + '" class="d-block w-100"></div>'
      photos[..-2].reverse_each do |p|
        html += '<div class="carousel-item "><img src="'+ p.image.url + '" class="d-block w-100"></div>'
      end
      render :js => html
    end

    private
      def user_detail
        params.require(:user).permit(:firstname, :lastname, :email)
      end
      def follow_user
        params.require(:followee_id)
      end
      def like_post
        { :likeable_type => params.require(:type), :likeable_id => params.require(:post_id), :user_id => params.require(:user_id) }
      end

end
