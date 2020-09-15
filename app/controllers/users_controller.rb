class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
      @user_own_profile = @user == current_user
      if @user_own_profile
        @photos = current_user.photos.where(album_id:nil).order(created_at: :desc)
        @albums = current_user.albums.order(created_at: :desc)
        @followings = current_user.followees.order(:firstname)
        @followers = current_user.followers.order(:firstname)
      else
        @photos = @user.photos.where(shared:true).order(created_at: :desc)
        @albums = @user.albums.where(shared:true).order(created_at: :desc)
        @followings = @user.followees.order(:firstname)
        @followers = @user.followers.order(:firstname)

      end
    end

    def create
      @user = User.new(user_detail)

      respond_to do |format|
          if @user.save
            MailerJob.perform_now @user
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end

    end

    def edit
    end

    def update
    end

    def follow
        @user = User.find(follow_user)
        follow = Follow.find_by(follower_id:current_user, followee_id:@user)
        if follow
            follow.destroy
        else
            current_user.followees << @user
        end
        render 'follow.js.erb'
    end

    def like
      like_rec = Like.find_by(like_post)
      if like_rec
        like_rec.destroy
      else
        Like.create(like_post)
      end
      render 'like.js.erb'
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
