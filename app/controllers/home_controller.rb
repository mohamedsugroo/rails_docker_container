class HomeController < ApplicationController

  def index
    render json: "server ready to go !!!! 1234 #{Time.now}"
  end

end
