module UsersHelper
  def followed? (current_user, post)
    current_user.followees.find_by(id: post.user_id)
  end
end
