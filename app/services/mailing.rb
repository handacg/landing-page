class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
		@lists={'designers' => 'c4ccbf00b1', 'cities'=> '1840ab84b7', 'students'=>'3d54626ae6'}
	end
	
	def new_subscriber(email,type)
		@gibbon.lists(@lists[type]).members.create(body: {email_address: email, status: "subscribed"})
		@gibbon.automations.actions.startallemails
	end

	def group_subscription
		@group.each {|email|
			new_subscriber(email)
		}
	end
end