class LandingController < ApplicationController
	def create
		email = params["email"]
		type = params['type']
		Subscriber.create(email: email, type: type)
		Mailing.new.new_subscriber(email,type)
		redirect_back(fallback_location: root_path)
	end

	def new
		@new_subscriber = Subscriber.new
		@types = ['designers','students','cities']
		@people = params[:people]

		if @types.index(@people) == nil
			redirect_to "/students"
		else
		end
	end

end
