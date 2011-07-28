class Account < ActiveRecord::Base
	attr_accessible :account_name, :realm
	
  belongs_to :user
		
	validates :account_name, :presence => 'true',
						:length => { :in => 4..20 },
						:uniqueness => 'true'
						
	validates_presence_of :realm
	validates_format_of :account_name, :with => /^[A-Za-z\d_]+$/
end