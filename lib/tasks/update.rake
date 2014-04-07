desc "send daily update"
  task update: :environment do 
    User.update
  end