class Item < ActiveRecord::Base
	def self.opened
		Item.where(event:"open").length 
	end

	def self.clicked
		Item.where(event:"click").length 
	end

	def self.statistics(email_type, *event)
		Item.where(email_type: email_type, event: event.join("")).length
	end

	def self.total_email_type(email_type)
		Item.where(email_type: email_type).length
	end
end
