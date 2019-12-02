class Account
  include Mongoid::Document

  field :account_number, type: String

  belongs_to :user

end
