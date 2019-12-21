class Validate::Unique

  def username(name)
    users = User.all
    users.each do |user|
      puts user[:username]
    end
  end

end
