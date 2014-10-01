class User < ActiveRecord::Base
  # attr_accessible :title, :body
  include ActiveModel::ForbiddenAttributesProtection

  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :email, :presence => true, :length => { :maximum => 100 }, 
    :format => EMAIL_REGEX

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
end
