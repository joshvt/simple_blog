class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation

  before_create { generate_token(:auth_token) }
  before_save :encrypt_password

  validates :email, presence: true, uniqueness: true
  validates :password, on: :create, confirmation: true
  #validates :email, format: { with: /^.+$/}

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def encrypt_password
	  	if password.present?
  		  self.password_salt = BCrypt::Engine.generate_salt()
  		  self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
	    end
  end

  def authenticate(password)
  	if self.password_hash == BCrypt::Engine.hash_secret(password, self.password_salt) 
  		self
	  else
  		nil
  	end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end
