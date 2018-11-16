class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
		@lists={
			'designers' => {list:'c4ccbf00b1',campaign:'82a2ae21d4'}, 
			'cities'=> {list:'1840ab84b7', campaign:'5f3a7521eb' }, 
			'students'=> {list:'3d54626ae6', campaign:'4ab17e3d67' }
		}
	end
	
	def new_subscriber(email, category)
		@gibbon.lists(@lists[category][:list]).members.create(body: {email_address: email, status: "subscribed"})
		@gibbon.automations(@lists[category][:campaign]).actions.startallemails
	end

	def group_subscription
		@group.each {|email|
			new_subscriber(email)
		}
	end
end