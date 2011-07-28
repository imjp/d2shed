class User < ActiveRecord::Base
	has_secure_password	
	before_create { generate_token(:auth_token) }
	
	attr_accessible :username, :email, :password
	
	has_many :accounts
	
	validates :username, :length => { :in => 4..20 }
	validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
	validates_presence_of :username, :email
	validates_presence_of :password, :on => :create
	validates_uniqueness_of :username, :email
	validates_format_of :username, :with => /^[A-Za-z\d_]+$/
	validates_length_of :password, :minimum => 8
	
	has_friendly_id :username, :use_slug => true, :approximate_ascii => true,
					:reserved_words => ['new', 'register', 'login', 'logout']

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end
	
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end				
		
	def next_user
		self.class.first(:conditions => ['username > ?', username], :order => 'username asc')
	end
	
	def previous_user
		self.class.first(:conditions => ['username < ?', username], :order => 'username desc')
	end
end
