class FeedPhoto

  def initialize(user)
    @user = user
  end

  def call
    Photo.where(user_id:@user.followees, shared:true, album_id:nil).or(Photo.where(user_id:@user, album_id:nil)).order(created_at: :desc)
  end

end
