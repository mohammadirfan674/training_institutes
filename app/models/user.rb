class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
after_create :send_user_mail
  def send_user_mail
    UsermailerMailer.welcome_mail(self).deliver_later

  end
has_one :profile
end
