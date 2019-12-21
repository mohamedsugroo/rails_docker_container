namespace :printer do
  desc "create Activities"
  task :sanaty => :environment do
    Activity.create({timestamp: Time.now})
  end
end
