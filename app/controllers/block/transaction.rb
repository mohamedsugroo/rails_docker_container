class Block::Transaction
  def self.start
  end

  def self.run_checks(users)
    balance(users)
  end

  private

    def self.balance(users)
      users.each do |user|
        if user[:sender] = true
          # run balanace check on the sender
        end
      end
    end

    def self.user_validate(users)
      user.each do |user|
        # check if the recipeint is a valid user
      end
    end

    def tax(account)
      if account = 'Merchant'
        # do something
      else
        # do something
      end
    end

end
