class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
	end
	
	def new_subscriber
		@gibbon.lists(513a1c8a9f).members.create(body: {email_address: @email, status: "subscribed"})
		@gibbon.automations.actions.startallemails
	end

end