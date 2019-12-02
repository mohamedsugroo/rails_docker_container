class User
  include Mongoid::Document

  field :username, type: String
  field :full_name, type: Array
  field :time_stamp, type: String

  has_one :account
end
