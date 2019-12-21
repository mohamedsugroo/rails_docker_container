class Block::Chain
  attr_accessor :block
  def initialize(data={})
    @block = data[:transaction] || 'transaction block missing data'
  end

  def compute_hash_with_proof_of_work( difficulty='0000' )
    nonce = 0
    loop do
      hash = calc_hash_with_nonce( nonce ).to_s
      if hash.start_with?( difficulty )
        return {nonce: nonce,hash: hash}
      else
        nonce += 1
      end
    end
  end

  def calc_hash_with_nonce(nonce = 0)
    sha = Digest::SHA256.new
    sha.update(nonce.to_s + block.to_s)
  end

  def new_block
    # check for prev_block
    prev = prev_block
    Block.create(
      {
        data: block,
        nonce: compute_hash_with_proof_of_work[:nonce],
        current_hash: compute_hash_with_proof_of_work[:hash],
        timestamp: Time.now,
        prev_hash: prev_block
      }
    )
  end

  def prev_block
    b = Block.all
    if b.count > 0
      hash = Block.all.desc('_id').limit(1).first
      return hash.current_hash
    else
      genesis_block
      hash = Block.all.desc('_id').limit(1).first
      return hash.current_hash
    end

  end

  def genesis_block
    Block.create(
      {
        data: "Genesis Block",
        nonce: compute_hash_with_proof_of_work[:nonce],
        current_hash: compute_hash_with_proof_of_work[:hash],
        timestamp: Time.now,
        prev_hash: "Genesis Block"
      }
    )
  end

end
