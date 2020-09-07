class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def show
    end

    def create
      @user = User.new(user_detail)

      respond_to do |format|
          if @user.save
            MailerJob.perform_later @user
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end

    end

    private
      def user_detail
        params.require(:user).permit(:firstname, :lastname, :email)
      end

end
