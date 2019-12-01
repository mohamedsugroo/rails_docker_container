class HomeController < ApplicationController

  def index
    render json: "server ready to go !!!! #{Time.now}"
  end

end
