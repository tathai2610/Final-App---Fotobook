module UsersHelper
  def followed? (current_user, user)
    current_user.followees.find_by(id: user)
  end

end
