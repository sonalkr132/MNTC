require 'digest/sha1'
class Admin < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor :password
  before_save :create_hashed_password
  after_save :clear_password
  

  def self.authenticate(username="", password="")
    user = Admin.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == Admin.hash_with_salt(password, salt)
  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private
  
  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = Admin.make_salt(username) if salt.blank?
      self.hashed_password = Admin.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end
end
