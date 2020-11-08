class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    photos = Photo.where(user_id: user_ids)
    @photos = photos.order(created_at: :desc)
  end
end