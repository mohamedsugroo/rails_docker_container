class RegisterJob < ApplicationJob
  queue_as :default

  def perform(data)
    User.create(data)
  end
end
