class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation

  before_save :encrypt_password

  validates :email, presence: true, uniqueness: true
  validates :password, on: :create, confirmation: true
  #validates :email, format: { with: /^.+$/}


  def encrypt_password
	  	if password.present?
  		  self.password_salt = BCrypt::Engine.generate_salt()
  		  self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
	    end
  end

  def self.authenticate(email, password)
  	user = find_by_email(email)
  	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) 
  		user
	  else
  		nil
  	end
  end
end
