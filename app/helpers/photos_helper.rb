module PhotosHelper
  def liked? (user, post)
    post.likes.find_by(user_id: user)
  end
end
