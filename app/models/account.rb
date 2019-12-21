class Account
  include Mongoid::Document

  field :number, type: String
  field :type, type: String
  field :status, type: String
  # status types are Pending|Suspended|Active

  belongs_to :user

  before_create :generate_account_number


  def generate_account_number
    number = []
    10.times do
      number.push(rand(0...9))
    end
    self.number = number.join('').to_s
  end

end
