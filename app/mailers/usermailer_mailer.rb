class UsermailerMailer < ApplicationMailer
	default from: 'mohammadirfn674@gmail.com'
   def acknowledge_mail(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Welcome to youngminds
        coaching institute, manoj')
   end
   def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'sucessful registration')
   end

end
