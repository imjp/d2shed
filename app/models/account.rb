class Account < ActiveRecord::Base
  belongs_to :user
	
	validates :account_name, :presence => 'true',
						:length => { :in => 4..20 },
						:uniqueness => 'true'
						
	validates_presence_of :realm
end