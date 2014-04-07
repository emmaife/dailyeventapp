desc "send daily update"
  task trigger_daily_emails: :environment do 
    User.trigger_daily_emails!
  end