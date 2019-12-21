class HomeController < ApplicationController

  def index
    transaction = {
      transaction: {
        timestamp: Time.now,
        sender: '76578798778',
        recipient: '76578798778',
        amount: 2.50,
        data: {
          method: 'Desktop|Mobile',
          url: request.original_url,
          ip: request.remote_ip,
          devices:{
            media_type: request.media_type,
          },
          location: {
            lat: 2.046934,
            long: 45.318161
          }
        },
      }
    }
    b = Block::Chain.new(transaction)
    b.new_block
    Activity.create({timestamp: Time.now})
    render json: Block.all
  end

end
