class Block
  include Mongoid::Document
  
  field :data
  field :nonce, type: String
  field :current_hash, type: String
  field :timestamp, type: String
  field :prev_hash, type: String

end
