class HomeController < ApplicationController

  def index
    user = User.all
    User.create(username: 'momo', time_stamp: Time.now)
    render json: user
  end

end
