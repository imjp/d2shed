class Character < ActiveRecord::Base
	attr_accessible :name, :type
	
  belongs_to :account
end
