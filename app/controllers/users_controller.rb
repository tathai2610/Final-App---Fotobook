class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
      @user_own_profile = @user == current_user
      if @user_own_profile
        @photos = Photo.where(user_id: current_user).order(created_at: :desc)
      else
        @photos = Photo.where(user_id: @user, shared: true).order(created_at: :desc)
      end
    end

    def show_album
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
      current_user = User.new(user_detail)
    end

    private
      def user_detail
        params.require(:user).permit(:firstname, :lastname, :email)
      end

end
