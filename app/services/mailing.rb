class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
	end
	
	def new_subscriber(email)
		@gibbon.lists('513a1c8a9f').members.create(body: {email_address: email, status: "subscribed"})
		@gibbon.automations.actions.startallemails
	end

	def group_subscription
		@group.each {|email|
			new_subscriber(email)
		}
	end
end