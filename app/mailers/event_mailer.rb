class EventMailer < ActionMailer::Base
  default from: "emma.ife@flatironschool.com"

  def event_email(user)
    @event = Event.new(user.neighborhoods, user.categories)
    mail(to: user.email, subject: 'Here is a great event')
  end

end
